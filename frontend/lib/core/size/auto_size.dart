import 'dart:async';
import 'dart:collection';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// 替代 runApp()
void runAutoSizeApp(Widget app) {
  AutoSizeWidgetsFlutterBinding.ensureInitialized();

  /// 屏幕尺寸初始化较晚，此操作可限制在尺寸赋值后继续操作
  final dispatcher = WidgetsBinding.instance.platformDispatcher;
  final flutterView = dispatcher.implicitView;

  if (flutterView != null && flutterView.physicalSize.isEmpty) {
    VoidCallback? oldMetricsChanged = dispatcher.onMetricsChanged;
    dispatcher.onMetricsChanged = () {
      if (!flutterView.physicalSize.isEmpty) {
        if (oldMetricsChanged != null) {
          oldMetricsChanged();
        }
        dispatcher.onMetricsChanged = oldMetricsChanged;
      }
    };
  }
}

class AutoSize {
  static const double NON_INIT_RATIO = 0.0;

  double baseScreenWidth = 375;

  // 屏幕宽
  double mediaWidth = 0;

  // 屏幕高
  double mediaHeight = 0;

  //屏幕像素密度
  double devicePixelRatio = NON_INIT_RATIO;

  double bottomBarHeight = 0;

  double statusBarHeight = 0;

  // 工厂模式
  factory AutoSize() => instance;

  static AutoSize get instance => _getInstance();
  static late AutoSize _instance;

  // AutoSize._internal();

  void initConfig({required double baseWidth}) {
    baseScreenWidth = baseWidth;

    devicePixelRatio = NON_INIT_RATIO;
    _tryInit();
  }

  void _tryInit() {
    if (devicePixelRatio != NON_INIT_RATIO) {
      return;
    }
    final flutterView = WidgetsBinding.instance.platformDispatcher.implicitView;

    if (flutterView != null) {
      devicePixelRatio = flutterView.physicalSize.width / baseScreenWidth;
      mediaWidth = baseScreenWidth;
      mediaHeight = flutterView.physicalSize.height / devicePixelRatio;
      statusBarHeight = flutterView.padding.top / devicePixelRatio;
      bottomBarHeight = flutterView.padding.bottom / devicePixelRatio;
    }
  }

  static AutoSize _getInstance() {
    // _instance ??= AutoSize._internal();
    _instance._tryInit();
    return _instance;
  }

  EdgeInsets getPadding() {
    return EdgeInsets.only(top: statusBarHeight, bottom: bottomBarHeight);
  }

  Size get screenSize => Size(mediaWidth, mediaHeight);
}

class AutoSizeWidgetsFlutterBinding extends WidgetsFlutterBinding {
  static WidgetsBinding ensureInitialized() {
    return WidgetsBinding.instance;
  }

  // @override
  // ViewConfiguration createViewConfiguration() {
  //   return ViewConfiguration(
  //     // size: AutoSizeUtils.instance.screenSize,
  //     devicePixelRatio: AutoSizeUtils.instance.devicePixelRatio,
  //   );
  // }

  /// 因为调整了 PixelRatio，所以对于 Event 事件，需要额外对事件的坐标进行对应比例的转换；
  @override
  void initInstances() {
    super.initInstances();
    final dispatcher = WidgetsBinding.instance.platformDispatcher;
    dispatcher.onPointerDataPacket = _handlePointerDataPacket;
  }

  @override
  void unlocked() {
    super.unlocked();
    _flushPointerEventQueue();
  }

  final Queue<PointerEvent> _pendingPointerEvents = Queue<PointerEvent>();

  void _handlePointerDataPacket(PointerDataPacket packet) {
    // _pendingPointerEvents.addAll(PointerEventConverter.expand(
    //     packet.data, AutoSize.instance.devicePixelRatio));
    if (!locked) _flushPointerEventQueue();
  }

  @override
  void cancelPointer(int pointer) {
    if (_pendingPointerEvents.isEmpty && !locked) {
      scheduleMicrotask(_flushPointerEventQueue);
    }
    _pendingPointerEvents.addFirst(PointerCancelEvent(pointer: pointer));
  }

  void _flushPointerEventQueue() {
    assert(!locked);
    while (_pendingPointerEvents.isNotEmpty) {
      _handlePointerEvent(_pendingPointerEvents.removeFirst());
    }
  }

  final Map<int, HitTestResult> _hitTests = <int, HitTestResult>{};

  void _handlePointerEvent(PointerEvent event) {
    assert(!locked);
    HitTestResult? result;
    if (event is PointerDownEvent) {
      assert(!_hitTests.containsKey(event.pointer));
      result = HitTestResult();
      // hitTest(result, event.position);
      _hitTests[event.pointer] = result;
    } else if (event is PointerUpEvent || event is PointerCancelEvent) {
      result = _hitTests.remove(event.pointer);
    } else if (event.down) {
      result = _hitTests[event.pointer];
    } else {
      return; // We currently ignore add, remove, and hover move events.
    }
    if (result != null) dispatchEvent(event, result);
  }
}

/// MediaQueryWrapper
class MediaQueryWrapper extends StatelessWidget {
  /// Creates a widget that delegates its build to a callback.
  ///
  /// The [builder] argument must not be null.
  const MediaQueryWrapper({
    super.key,
    required this.builder,
  });

  /// Called to obtain the child widget.
  ///
  /// This function is called whenever this widget is included in its parent's
  /// build and the old widget (if any) that it synchronizes with has a distinct
  /// object identity. Typically the parent's build method will construct
  /// a new tree of widgets and so a new Builder child will not be [identical]
  /// to the corresponding old one.
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.noScaling,
          size: AutoSize.instance.screenSize,
          padding: AutoSize.instance.getPadding(),
          devicePixelRatio: AutoSize.instance.devicePixelRatio,
        ),
        child: builder(context));
  }
}
