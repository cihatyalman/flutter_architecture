import 'package:flutter/material.dart';

import '../helpers/state_managements/main_store.dart';
import '../helpers/state_managements/store/store_models.dart';

enum StatusType { idle, loading, isNotLogin, isLogin }

class SplashViewModel {
  final statusStore = StoreData<StatusType>.create(StatusType.idle);

  void startFunction(BuildContext context) async {
    statusStore.data = StatusType.loading;
    mainStore.screenSize = MediaQuery.of(context).size;

    await Future.delayed(const Duration(seconds: 1));
    statusStore.data = StatusType.isLogin;
  }
}
