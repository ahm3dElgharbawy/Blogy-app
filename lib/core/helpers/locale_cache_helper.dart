import 'package:blog_app/core/constants/app_strings.dart';
import 'package:blog_app/core/helpers/cache_helper.dart';

abstract class LocaleCacheHelper {
  static String langCode = "en";
  static Future<void> cacheLangCode(String newLangCode) async {
    CacheHelper.setString(kLocale, newLangCode);
    langCode = newLangCode;
  }

  static Future<String> getCachedLangCode() async {
    final cachedLocal = await CacheHelper.getString(kLocale);
    langCode = cachedLocal ?? "en"; // default language for app will be en
    return langCode;
  }
}
