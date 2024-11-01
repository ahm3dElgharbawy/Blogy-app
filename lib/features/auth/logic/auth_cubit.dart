import 'package:blog_app/core/constants/app_strings.dart';
import 'package:blog_app/core/constants/endpoints.dart';
import 'package:blog_app/core/helpers/cache_helper.dart';
import 'package:blog_app/core/helpers/dio_helper.dart';
import 'package:blog_app/core/helpers/user_local_helper.dart';
import 'package:blog_app/features/auth/data/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  //? login
  void login({required String email, required String password}) {
      emit(LoginLoading());
      DioHelper.postData(url: EndPoints.login, body: {
        'email': email.trim(),
        'password': password
      }).then((result) {
        result.fold(
          (failure) => emit(LoginFailure(message: failure.message)),
          (response) {
            final data = response.data;
            final user = User.fromJson(data['user']);
            // storing user token
            CacheHelper.setString(kToken, data['token']);
            // storing user data
            CacheHelper.setString(kUser, userToJson(user));
            UserLocal.init();
            emit(LoginSuccess());
          },
        );
      });
  }


  //? register
  void register({required Map data}) {
      emit(RegisterLoading());
      DioHelper.postData(url: EndPoints.register, body: data).then((result) {
        result.fold(
          (failure) => emit(RegisterFailure(message: failure.message)),
          (response) {
            // filling login fields with registered data
            emit(RegisterSuccess());
          },
        );
      });
  }

  //? logout
  void logout() {
      emit(LogoutLoading());
      DioHelper.postData(url: EndPoints.logout).then((result) {
        result.fold(
          (failure) => emit(LogoutFailure(message: failure.message)),
          (response) {
            emit(LogoutSuccess());
          },
        );
      });
  }
}
