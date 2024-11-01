import 'package:blog_app/core/helpers/locale_cache_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:blog_app/core/errors/failures.dart';
import 'package:blog_app/core/helpers/extensions.dart';
import 'package:blog_app/core/helpers/user_local_helper.dart';

class DioHelper {
  static Dio dio = Dio();
  static get getHeaders => {
        'Accept': 'application/json',
        "Authorization": "Bearer ${UserLocal.token}",
      };
  static Future<Either<Failure, Response>> getData(
      {required String url}) async {
    try {
      Response response = await dio.get(
        url,
        queryParameters: {'lang': LocaleCacheHelper.langCode},
        options: Options(
          headers: getHeaders,
        ),
      );
      return right(response);
    } on DioException catch (e) {
      return left(Failure.fromDioError(e));
    } catch (e) {
      return left(Failure("UnExpected Failure".tr));
    }
  }

  static Future<Either<Failure, Response>> postData({
    required String url,
    Object? body,
    String? token,
  }) async {
    try {
      Response response = await dio.post(
        url,
        data: body,
        queryParameters: {'lang': LocaleCacheHelper.langCode},
        options: Options(headers: getHeaders),
      );
      return right(response);
    } on DioException catch (e) {
      return left(Failure.fromDioError(e));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  static Future<Either<Failure, Response>> putData({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Response response = await dio.put(
        url,
        data: body,
        queryParameters: {'lang': LocaleCacheHelper.langCode},
        options: Options(headers: getHeaders),
      );
      return right(response);
    } on DioException catch (e) {
      return left(Failure.fromDioError(e));
    } catch (e) {
      return left(Failure("UnExpected Failure".tr));
    }
  }

  static Future<Either<Failure, Response>> deleteData({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Response response = await dio.delete(
        url,
        data: body,
        queryParameters: {'lang': LocaleCacheHelper.langCode},
        options: Options(headers: getHeaders),
      );
      return right(response);
    } on DioException catch (e) {
      return left(Failure.fromDioError(e));
    } catch (e) {
      return left(Failure("UnExpected Failure".tr));
    }
  }
}
