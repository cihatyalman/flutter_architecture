import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../constants/color_constants.dart';
import '../helpers/route_generator.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class MainScreen extends StatefulWidget {
  static const route = 'MainScreen';
  final RouteSettings settings;
  const MainScreen({super.key, required this.settings});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // NOT: Ana ekranlarin context degerini ...(BuildContext context) bu sekilde fonsiyonlara gonderme.
  // Navigator.... islemleri hangi contenxt degerini kullanirsa ona gore sayfa route agaci degisir.
  int _currentIndex = 0;

  final iconList = [Icons.one_k, Icons.two_k, Icons.account_circle];

  @override
  void initState() {
    super.initState();
    setState(() => _currentIndex = (widget.settings.arguments as int?) ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: _navigatorKey,
        initialRoute: _getScreenName(_currentIndex),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        backgroundColor: Colors.white,
        height: 52,
        borderColor: Colors.grey.shade300,
        itemCount: iconList.length,
        tabBuilder: (index, isActive) {
          final color =
              isActive ? ColorConstants.primaryColor : Colors.blueGrey.shade100;
          return Center(child: Icon(iconList[index], color: color));
        },
        gapLocation: GapLocation.none,
        activeIndex: _currentIndex,
        onTap: (index) {
          if (_currentIndex != index) {
            setState(() => _currentIndex = index);
            _navigatorKey.currentState
                ?.pushReplacementNamed(_getScreenName(index));
          }
        },
      ),
    );
  }

  String _getScreenName(int index) {
    return [
      HomeScreen.route,
      HomeScreen.route,
      ProfileScreen.route,
    ][index];
  }
}
