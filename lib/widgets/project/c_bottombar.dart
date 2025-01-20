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
    const iconList = [
      Icons.one_k,
      Icons.two_k,
      Icons.three_k,
      Icons.four_k,
      Icons.account_circle
    ];
    return AnimatedBottomNavigationBar.builder(
      backgroundColor: Colors.white,
      shadow: const BoxShadow(
          color: Colors.black12, offset: Offset(0, -2), blurRadius: 1),
      leftCornerRadius: 16,
      rightCornerRadius: 16,
      itemCount: iconList.length,
      tabBuilder: (index, isActive) {
        final color = isActive
            ? ColorConstants.primaryColor
            : ColorConstants.primaryColor.withValues(alpha: .25);
        return Center(child: Icon(iconList[index], color: color));
      },
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
