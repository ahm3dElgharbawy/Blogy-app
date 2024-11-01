import 'dart:async' show Future;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:blog_app/core/constants/app_strings.dart';
import 'package:blog_app/core/helpers/locale_cache_helper.dart';

class CacheHelper {
  CacheHelper._();
  static late FlutterSecureStorage storage;
  static Future init() async {
    storage = const FlutterSecureStorage();
  }

  static Future<String?> getString(String key) async {
    return await storage.read(key: key);
  }

  static Future<void> setString(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  static Future<void> delete(String key) async {
    await storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await storage.deleteAll();
    CacheHelper.setString(kInitialScreenIndex, "1");
    LocaleCacheHelper.cacheLangCode(LocaleCacheHelper.langCode);
  }
}
