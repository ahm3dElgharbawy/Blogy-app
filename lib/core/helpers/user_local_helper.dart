import 'package:blog_app/core/constants/app_strings.dart';
import 'package:blog_app/core/helpers/cache_helper.dart';
import 'package:blog_app/features/auth/data/models/user.dart';

class UserLocal {
  UserLocal._();
  static User? user;
  static String? token;
  static Future<void> init() async {
    user = await _getUser();
    token = await CacheHelper.getString(kToken);
  }

  static Future<User?> _getUser() async {
    String? userAsString = await CacheHelper.getString(kUser);
    user = userAsString == null ? null : userFromJson(userAsString);
    return user;
  }

  static void update(User newUser) {
    user = newUser;
    CacheHelper.setString(kUser, userToJson(newUser));
  }

  static void logout(){
    CacheHelper.setString(kInitialScreenIndex, "1");
  }
}
