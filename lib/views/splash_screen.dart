// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import '../view_models/splash_viewmodel.dart';
import '../widgets/project/c_text.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const route = 'SplashScreen';

  final vm = SplashViewModel();

  @override
  Widget build(BuildContext context) {
    vm.startFunction(context);

    return Scaffold(
      body: vm.statusStore.listen((data, _) {
        if (![StatusType.idle, StatusType.loading].contains(data)) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) => Navigator.pushReplacementNamed(
              context,
              <StatusType, String>{
                StatusType.isNotLogin: HomeScreen.route,
                StatusType.isLogin: HomeScreen.route,
              }[data]!,
              arguments: data,
            ),
          );
        }
        return body();
      }),
    );
  }

  Widget body() {
    return Container(
      decoration: const BoxDecoration(),
      child: Center(child: CText("AppName")),
    );
  }
}
