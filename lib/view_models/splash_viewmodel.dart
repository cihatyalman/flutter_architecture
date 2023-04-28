// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';

import '../core/utils/mixins/context_mixin.dart';
import '../helpers/state_managements/data_notifier.dart';

enum StatusType { idle, loading, isNotLogin, isLogin }

class SplashViewModel {
  DataNotifier<StatusType>? _statusNotifier;
  DataNotifier<StatusType> get statusNotifier =>
      _statusNotifier ??= DataNotifier(StatusType.idle);

  void setScreenSize(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
  }

  void startFunction() async {
    statusNotifier.value = StatusType.loading;
    await Future.delayed(const Duration(seconds: 3));
    statusNotifier.value = StatusType.isLogin;
  }
}
