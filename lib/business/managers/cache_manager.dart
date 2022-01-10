// Documents and Integration
// https://pub.dev/packages/hive

// hive: 
// hive_flutter: 

import 'package:hive_flutter/hive_flutter.dart';

final cacheManager = CacheManager();

class CacheManager {
  late Box<String?> box;

  Future init() async {
    await Hive.initFlutter();
    box = await Hive.openBox<String?>('cache');
  }

// #region Token
  String? get token {
    final data = box.get('token');
    return (data != null && data.isNotEmpty) ? data : null;
  }
  Future<void> setToken(String? value) async => await box.put('token', value);
  Future<void> deleteToken() async => await box.delete('token');
// #endregion
}
