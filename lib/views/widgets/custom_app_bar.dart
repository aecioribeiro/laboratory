import 'package:flutter/material.dart';

class CustomAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      decoration: const BoxDecoration(color: Colors.blue),
      padding: const EdgeInsets.fromLTRB(25, 55, 25, 25),
      child: shrinkOffset >= 30
          ? const Icon(Icons.search_rounded)
          : const SizedBox(
              height: 120,
              child: TextField(),
            ),
    );
  }

  @override
  double get maxExtent => 120;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
