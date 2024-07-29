import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_wan_android/core/net/api_error.dart';
import 'package:flutter_wan_android/core/page/base/base_controller.dart';
import 'package:flutter_wan_android/core/utils/overlay_utils.dart';

abstract class GetRefreshController<T> extends BaseController {
  EasyRefreshController refreshController = EasyRefreshController(
      controlFinishRefresh: true, controlFinishLoad: true);

  @override
  void onReady() {
    /// 如果页面一进来就要展示刷新头部，只调用callRefresh
    if (startRefresh()) {
      callRefresh();
    } else {
      onRefresh();
    }
  }

  /// 刷新数据
  Future<void> onRefresh() async {
    loadData().then((result) {
      if (result != null) {
        data = result;
        showSuccessPage();
      } else {
        showEmptyPage();
      }
      refreshController.finishRefresh();
    }).catchError((error, _) {
      showErrorPage((error as ApiError).origin);
      refreshController.finishRefresh();
    });
  }

  /// 加载更多
  Future<void> onLoadMore() async {}

  /// 加载数据的方法，子类去实现
  Future<T?> loadData();

  /// 重新刷新，默认使用LoadingPage，不想用这个可以自己重写本方法
  @override
  void retryLoading() {
    showLoadingPage();
    onRefresh();
  }

  /// 主动刷新
  void callRefresh() {
    refreshController.callRefresh();
  }

  /// 第一次进入页面刷新
  bool startRefresh() => false;

  /// 销毁时刷新控件一起销毁
  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}

/// 加载List数据类型的控制器
abstract class GetRefreshListController<T>
    extends GetRefreshController<List<T>> {
  /// 分页的页数
  int initPage;
  int pageSize;
  int page;

  GetRefreshListController({this.initPage = 0, this.pageSize = 20})
      : page = initPage;

  /// 刷新数据
  @override
  Future<void> onRefresh() async {
    /// 重置页码
    page = initPage;

    loadListData(page, true).then((result) {
      if (result.isNotEmpty) {
        data = result;
        showSuccessPage();

        /// 刷新的时候，没有更多数据需要去掉上拉加载，没有有更多数据则要重置加载状态
        if (result.length < pageSize) {
          refreshController;
        }
      } else {
        if (data.isEmpty) {
          showEmptyPage();
        }
      }

      /// 刷新完成，这里要注意一定是先展示成功的页面，加载EasyRefresh控件
      /// 再调用RefreshController的方法才有用，不然会报错。
      refreshController.finishRefresh();
    }).catchError((error, _) {
      /// 如果有数据则提示吐司，如果没有数据则展示错误图
      if (data.isNotEmpty) {
        OverlayUtils.showToast("刷新失败了");
      } else {
        showErrorPage((error as ApiError).origin);
      }
    });
  }

  /// 加载更多
  @override
  Future<void> onLoadMore() async {
    page += 1;

    loadListData(page, false).then((result) {
      if (result.isNotEmpty) {
        addData(result);

        /// 更新界面
        showSuccessPage();
      } else {
        OverlayUtils.showToast("没有更多数据了");
      }

      /// 加载完成
      refreshController.finishLoad();
    }).onError((error, stack) {
      /// 加载失败要 重置页码
      page -= 1;
      refreshController.finishLoad();
      OverlayUtils.showToast(error.toString());
    });
  }

  /// 加载数据的方法，子类去实现
  @override
  Future<List<T>> loadData() => loadListData(page, true);

  /// 重新封装一下，专门加载List数据类型
  Future<List<T>> loadListData(int page, bool isRefresh);

  /// 添加数据
  void addData(List<T> data) {
    if (data.isNotEmpty) {
      this.data.addAll(data);
    }
  }

  /// 返回的是一个列表
  @override
  List<T> get data => super.data ?? [];
}
