import 'package:flutter/material.dart';
import 'package:partypay/shared/utils/AppColors.dart';

class PersistentHeader extends SliverPersistentHeaderDelegate {
  final Widget child;

  PersistentHeader({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.all(0),
        color: AppColors.white,
        elevation: 5.0,
        child: Center(child: child),
      ),
    );
  }

  @override
  double get maxExtent => 90.0;

  @override
  double get minExtent => 90.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}