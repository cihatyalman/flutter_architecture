import 'package:flutter/material.dart';

import '../views/home_screen.dart';
import '../views/splash_screen.dart';

class RouteGenerator {
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

  static MaterialPageRoute _getPageRouteBuilder(Widget screen) =>
      MaterialPageRoute(builder: (context) => screen);

  // static PageRouteBuilder _getPageRouteBuilderZero(Widget screen) =>
  //     PageRouteBuilder(
  //       pageBuilder: (context, animation, secondaryAnimation) => screen,
  //     );

  // static PageRouteBuilder _getPageRouteBuilderLeft(Widget screen) =>
  //     PageRouteBuilder(
  //       pageBuilder: (context, animation, secondaryAnimation) {
  //         const begin = Offset(-1, 0);
  //         const end = Offset.zero;
  //         const curve = Curves.ease;

  //         final tween =
  //             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //         return SlideTransition(
  //           position: animation.drive(tween),
  //           child: screen,
  //         );
  //       },
  //     );

  // static PageRouteBuilder _getPageRouteBuilderRight(Widget screen) =>
  //     PageRouteBuilder(
  //       pageBuilder: (context, animation, secondaryAnimation) {
  //         const begin = Offset(1, 0);
  //         const end = Offset.zero;
  //         const curve = Curves.ease;

  //         final tween =
  //             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //         return SlideTransition(
  //           position: animation.drive(tween),
  //           child: screen,
  //         );
  //       },
  //     );
}
