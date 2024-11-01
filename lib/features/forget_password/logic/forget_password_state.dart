part of 'forget_password_cubit.dart';

sealed class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class CheckEmailLoading extends ForgetPasswordState {}
final class CheckEmailSuccess extends ForgetPasswordState {}
final class CheckEmailFailure extends ForgetPasswordState {
  final String message;
  const CheckEmailFailure({required this.message});
}

final class CheckOtpLoading extends ForgetPasswordState {}
final class CheckOtpSuccess extends ForgetPasswordState {}
final class CheckOtpFailure extends ForgetPasswordState {
  final String message;
  const CheckOtpFailure({required this.message});
}

final class ResetPasswordLoading extends ForgetPasswordState {}
final class ResetPasswordSuccess extends ForgetPasswordState {}
final class ResetPasswordFailure extends ForgetPasswordState {
  final String message;
  const ResetPasswordFailure({required this.message});
}
