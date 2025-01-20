import 'package:flutter/material.dart';

import '../helpers/state_managements/main_store.dart';
import '../helpers/state_managements/data_notifier.dart';

enum StatusType { idle, loading, isNotLogin, isLogin }

class SplashViewModel {
  DataNotifier<StatusType>? _statusNotifier;
  DataNotifier<StatusType> get statusNotifier =>
      _statusNotifier ??= DataNotifier(StatusType.idle);

  void startFunction(BuildContext context) async {
    statusNotifier.value = StatusType.loading;
    mainStore.screenSize = MediaQuery.of(context).size;

    await Future.delayed(const Duration(seconds: 1));
    statusNotifier.value = StatusType.isLogin;
  }
}
