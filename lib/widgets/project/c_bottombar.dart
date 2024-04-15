import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../../constants/color_constants.dart';
import '../../main.dart';
import '../../views/home_screen.dart';
import '../../views/profile_screen.dart';

final cBottomBar = CBottomBar();

class CBottomBar {
  final resize = false;

  Widget bottomBar([int? bottomBarIndex]) {
    const color = ColorConstants.primaryColor;

    return AnimatedBottomNavigationBar(
      activeColor: color,
      inactiveColor: color.withOpacity(.25),
      backgroundColor: ColorConstants.backgroundColor,
      elevation: 0,
      borderColor: Colors.black,
      icons: const [
        Icons.one_k,
        Icons.two_k,
        Icons.three_k,
        Icons.four_k,
        Icons.account_circle
      ],
      gapLocation: GapLocation.none,
      activeIndex: bottomBarIndex ?? 10,
      onTap: (index) {
        if (bottomBarIndex != index) {
          navigatorKey.currentState!
              .pushNamedAndRemoveUntil(_getScreenName(index), (route) => false);
        }
      },
    );
  }

  String _getScreenName(int index) {
    return [
      HomeScreen.route,
      HomeScreen.route,
      HomeScreen.route,
      HomeScreen.route,
      ProfileScreen.route,
    ][index];
  }
}
