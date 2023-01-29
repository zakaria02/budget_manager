import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unicons/unicons.dart';

import '../../../styles/styles.dart';
import '../bloc/navigation/navigation_cubit.dart';

class HomePageBottomBar extends StatelessWidget {
  final List<IconData> iconItems = [
    UniconsLine.calender,
    UniconsLine.wallet,
  ];

  HomePageBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageNavCubit, HomePageNavState>(
      builder: (context, navigationState) {
        return AnimatedBottomNavigationBar(
          activeColor: primary,
          splashColor: secondary,
          inactiveColor: Colors.black.withOpacity(0.5),
          icons: iconItems,
          activeIndex: navigationState.index,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          leftCornerRadius: 10,
          iconSize: 25,
          rightCornerRadius: 10,
          onTap: (index) {
            context.read<HomePageNavCubit>().setPage(
                  index == 0 ? NavbarItem.summary : NavbarItem.details,
                );
          },
        );
      },
    );
  }
}
