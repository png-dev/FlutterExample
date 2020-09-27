import 'package:flutter/material.dart';
import 'package:github_repo/resources/app_const.dart';
import 'package:github_repo/widgets/loading_state.dart';

class SliverAppbarDelegate extends SliverPersistentHeaderDelegate {
  final Container _tabBar;
  final int tabIndex;
  final StateFlag _loadingState;

  SliverAppbarDelegate(this._loadingState, this._tabBar, {this.tabIndex});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  double get maxExtent =>
      _loadingState == StateFlag.complete ? AppConst.TAB_HEIGHT : 0;

  @override
  double get minExtent =>
      _loadingState == StateFlag.complete ? AppConst.TAB_HEIGHT : 0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
