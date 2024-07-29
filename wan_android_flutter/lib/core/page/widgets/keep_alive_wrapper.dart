import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 在[TabBar]或者[BottomNavigationBar]使用场景中，每次切换tab时，对应的Page都会刷新。
/// 为了避免每次切换Page都会刷新一遍，需要对应的Page实现[AutomaticKeepAliveClientMixin]，并且复写wantKeepAlive方法
/// 同时，因为Getx中的[GetView]不是实现StatefulWidget组件，所以不能使用[AutomaticKeepAliveClientMixin]，为了解决这个问题，
/// 只能在GetView的父组件去实现。
///
/// 使用时，只需要[KeepAliveWrapper]包裹对应的Page就行。
/// KeepAliveWrapper(child: HomePage())
///
class KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const KeepAliveWrapper({super.key, required this.child});

  @override
  State<StatefulWidget> createState() => _KeepAliveWrapperState();
}

class _KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
