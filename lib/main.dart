// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'helpers/design_helper.dart';
import 'helpers/route_generator.dart';
import 'views/splash_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  // ...
  lifecycleInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Name',
        theme: DesignHelper().mainTheme,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [Locale('tr')],
        locale: const Locale('tr'),
        navigatorKey: navigatorKey,
        initialRoute: SplashScreen.route,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// #region Lifecycle
typedef FutureVoidCallback = Future<void> Function();

class LifecycleEventHandler extends WidgetsBindingObserver {
  final FutureVoidCallback? resumedCallBack;
  final FutureVoidCallback? pausedCallBack;
  final FutureVoidCallback? killedCallBack;

  LifecycleEventHandler({
    this.resumedCallBack,
    this.pausedCallBack,
    this.killedCallBack,
  });

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        await resumedCallBack?.call();
        break;
      case AppLifecycleState.paused:
        await pausedCallBack?.call();
        break;
      case AppLifecycleState.detached:
        await killedCallBack?.call();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }
}

lifecycleInit() {
  WidgetsBinding.instance.addObserver(LifecycleEventHandler(
    resumedCallBack: () async {
      print("[C_app]: Resume");
    },
    pausedCallBack: () async {
      print("[C_app]: Pause");
    },
    killedCallBack: () async {
      print("[C_app]: Kill");
    },
  ));
}
// #endregion
