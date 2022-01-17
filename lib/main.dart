import 'package:flutter/material.dart';

import 'exports/export_screens.dart' show SplashScreen;
import 'exports/export_business.dart' show RouteGenerator, hd, prefManager;

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await prefManager.init();
  // ...
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Architecture',
      theme: hd.mainTheme,
      initialRoute: SplashScreen.route,
      navigatorKey: navigatorKey,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
