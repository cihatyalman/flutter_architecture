// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../view_models/splash_viewmodel.dart';
import '../widgets/project_widgets/c_text.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const route = 'SplashScreen';

  late _ScreenWidgets screenWidgets;
  final splashViewModel = SplashViewModel();

  @override
  Widget build(BuildContext context) {
    screenWidgets = _ScreenWidgets(context: context, widget: this);
    splashViewModel.setScreenSize(context);
    splashViewModel.startFunction();
    return Scaffold(
      body: splashViewModel.listenWidget(
        (data) {
          if (![StatusType.idle, StatusType.loading].contains(data)) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => Navigator.pushReplacementNamed(
                  context,
                  data == StatusType.isTrue
                      ? HomeScreen.route
                      : HomeScreen.route),
            );
          }
          return screenWidgets.bodyWidget(route);
        },
      ),
    );
  }
}

class _ScreenWidgets {
  final BuildContext context;
  final SplashScreen widget;

  _ScreenWidgets({required this.context, required this.widget});

  Widget bodyWidget(String text) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          radius: 2,
          colors: [Colors.white, Colors.black],
        ),
      ),
      child: Center(child: CText(text, size: 18)),
    );
  }
}
