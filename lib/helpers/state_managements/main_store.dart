import 'package:flutter/material.dart';

import '../../models/api/user_model.dart';
import 'store/store_models.dart';

final mainStore = MainStore();

class MainStore {
  Size screenSize = Size.infinite;
  Map<String, dynamic>? notiData;

  final user = StoreData<UserModel?>.create(null);

  /// pop olmayan bir ekran(until) açıldığında kullan
  void lazyClear() {}

  /// Hesaptan çıkış yapınca kullan
  void clear() {
    user.data = null;

    lazyClear();
  }
}
