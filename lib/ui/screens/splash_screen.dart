// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import '../../exports/export_screens.dart' show HomeScreen;

class SplashScreen extends StatelessWidget {
  static const route = 'SplashScreen';

  late _ScreenWidgets screenWidgets;

  @override
  Widget build(BuildContext context) {
    screenWidgets = _ScreenWidgets(context: context, widget: this);
    return Scaffold(
      body: FutureBuilder<bool>(
        future: screenWidgets.startFunction(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            WidgetsBinding.instance?.addPostFrameCallback(
              (_) => Navigator.pushReplacementNamed(context, HomeScreen.route),
            );
          }
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: 2,
                colors: [Colors.white,Colors.black],
              ),
            ),
            child: const Center(child: Text(route)),
          );
        },
      ),
    );
  }
}

class _ScreenWidgets {
  final BuildContext context;
  final SplashScreen widget;

  _ScreenWidgets({
    required this.context,
    required this.widget,
  });

  Future<bool> startFunction() async {
    await Future.delayed(const Duration(seconds: 3));
    return true;
  }
}
