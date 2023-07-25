// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../constants/color_constants.dart';
import '../view_models/splash_viewmodel.dart';
import '../widgets/project_widgets/c_text.dart';
import '../widgets/project_widgets/widget_helper.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const route = 'SplashScreen';

  final vm = SplashViewModel();

  @override
  Widget build(BuildContext context) {
    vm.setScreenSize(context);
    vm.startFunction();
    return Scaffold(
      body: vm.statusNotifier.listenWidget(
        (data, _) {
          if (![StatusType.idle, StatusType.loading].contains(data)) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) => Navigator.pushReplacementNamed(
                  context,
                  data == StatusType.isLogin
                      ? HomeScreen.route
                      : HomeScreen.route),
            );
          }
          return bodyWidget("Flutter\nArchitecture");
        },
      ),
    );
  }

  Widget bodyWidget(String text) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorConstants.backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          hw.logoWidget(),
          hw.sizedBoxVertical(),
          CText(
            text,
            size: 24,
            isBold: true,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
