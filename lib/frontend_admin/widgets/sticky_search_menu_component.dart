import 'package:flutter/material.dart';

class StickySearchBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget widget;
  StickySearchBarDelegate({required this.widget});
  @override
  double get minExtent => 68; // exact height of search bar
  @override
  double get maxExtent => 68;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // Optional: Add shadow when scrolling down
    final showShadow = shrinkOffset > 0;

    return Container(
      height: 68,
      // color: primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          // color: primaryColor,
          boxShadow: showShadow
              ? [
                  const BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ]
              : [],
        ),
        child: widget,
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
