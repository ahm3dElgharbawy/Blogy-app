import 'package:blog_app/core/constants/endpoints.dart';
import 'package:blog_app/core/helpers/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  late String code;
  late String email;

  void checkEmail({required String email}) {
    emit(CheckEmailLoading());
    DioHelper.postData(url: EndPoints.checkEmail, body: {
      'email': email,
    }).then((result) {
      result.fold(
        (failure) => emit(CheckEmailFailure(message: failure.message)),
        (response) {
          email = email;
          emit(CheckEmailSuccess());
        },
      );
    });
  }

  void checkOtp({required String otp}) {
    emit(CheckOtpLoading());
    DioHelper.postData(url: EndPoints.checkOtp, body: {
      'code': otp,
    }).then((result) {
      result.fold(
        (failure) => emit(CheckOtpFailure(message: failure.message)),
        (response) {
          code = otp;
          emit(CheckOtpSuccess());
        },
      );
    });
  }

  void resetPassword({required String newPassword}) {
    emit(ResetPasswordLoading());
    DioHelper.postData(url: EndPoints.checkOtp, body: {
      'code': code,
      'password' : newPassword,
      'password_confirmation' : newPassword,
    }).then((result) {
      result.fold(
        (failure) => emit(ResetPasswordFailure(message: failure.message)),
        (response) {
          emit(ResetPasswordSuccess());
        },
      );
    });
  }
}
