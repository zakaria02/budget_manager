import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../styles/styles.dart';

class HomePageBottomBar extends StatelessWidget {
  final List<IconData> iconItems = [
    UniconsLine.calender,
    UniconsLine.wallet,
  ];

  HomePageBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: 0,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        if (index == 0) {
        } else if (index == 1) {}
      },
    );
  }
}
