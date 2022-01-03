import 'package:flutter/material.dart';
import '../../exports/export_screens.dart';

class RouteGenerator {
  static const double _scaleFactor = 1;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return _getPageRouteBuilder(SplashScreen());
      case HomeScreen.route:
        return _getPageRouteBuilder(HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(),
            body: const Center(child: Text("ERROR")),
          ),
        );
    }
  }

  static PageRouteBuilder _getPageRouteBuilder(Widget screen) =>
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: _scaleFactor),
          child: screen,
        ),
      );
}