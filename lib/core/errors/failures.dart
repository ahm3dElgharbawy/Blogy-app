
import 'package:blog_app/features/auth/screens/login/login.dart';
import 'package:dio/dio.dart';
import 'package:blog_app/core/constants/app_strings.dart';
import 'package:blog_app/core/helpers/cache_helper.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/core/helpers/navigation/navigation_helper.dart';

class Failure {
  final String message;
  const Failure(this.message);

  factory Failure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return Failure('Connection timeout with ApiServer'.tr);

      case DioExceptionType.sendTimeout:
        return Failure('Send timeout with ApiServer'.tr);

      case DioExceptionType.receiveTimeout:
        return Failure('Receive timeout with ApiServer'.tr);

      case DioExceptionType.badResponse:
        return Failure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return Failure('Request to ApiServer was canceled'.tr);
      case DioExceptionType.connectionError:
        return Failure('Please check your internet connection'.tr);
      default:
        if (dioError.message != null &&
            dioError.message!.contains('SocketException')) {
          return Failure('No Internet Connection'.tr);
        }
        return Failure('Oops There was an Error, Please try again'.tr);
    }
  }

  factory Failure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403 ||
        statusCode == 405 ||
        statusCode == 422) {
      if (statusCode == 403) { // when token expired
        CacheHelper.setString(kInitialScreenIndex,"1"); // open later on the login screen if not logged in
        NavigationHelper.pushReplacementAll(const LoginScreen());
      }
      // print(object)
      return Failure(response['message']);
    } else if (statusCode == 404) {
      return Failure('Your request not found, Please try later!'.tr);
    } else if (statusCode == 500) {
      return Failure('Internal Server error, Please try later'.tr);
    } else {
      return Failure('Oops There was an Error, Please try again'.tr);
    }
  }
}
