import 'package:flutter/material.dart';

import 'business/helpers/design_helper.dart';
import 'business/helpers/route_generator.dart';
import 'core/cache_service/cache_service.dart';
import 'ui/screens/splash_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await cacheService.init();
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
