import 'package:flutter/material.dart';

import '../../models/api/user_model.dart';
import 'store/store_models.dart';

final mainStore = MainStore();

class MainStore {
  Size screenSize = Size.infinite;
  Map<String, dynamic>? notiData;

  final user = StoreData<UserModel>.create(UserModel());

  /// pop olmayan bir ekran(until) acildiginda kullan
  void lazyClear() {}

  /// Hesaptan cikis yapinca kullan
  void clear() {
    user.data = UserModel();

    lazyClear();
  }
}
