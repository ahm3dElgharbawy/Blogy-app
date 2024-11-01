import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/core/helpers/locale_cache_helper.dart';

class CustomHelperFunctions {
  static bool isEmail(String? value) {
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    if (value != null && emailRegex.hasMatch(value)) {
      return true;
    }
    return false;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required'.tr;
    }
    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(RegExp(r'\d'));
    bool hasMinLength = password.length >= 6;
    if (!hasMinLength) {
      return 'Password must be at least 6 characters long'.tr;
    }
    if (!hasUppercase) {
      return 'Password must contain at least one uppercase letter'.tr;
    }
    if (!hasDigits) {
      return 'Password must contain at least one number'.tr;
    }
    return null;
  }

  static bool isSvg(String url) {
    return url.toLowerCase().endsWith('.svg');
  }

  static String trans({required String enText, required String arText}) {
    // For translate data that coming from the api
    // IF current language is ar return the arabic string else return the english one
    return LocaleCacheHelper.langCode == "en" ? enText : arText;
  }

}
