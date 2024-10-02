part of 'forget_password_cubit.dart';


abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordSuccessState extends ForgetPasswordState {
  final ForgetPasswordModel forgetPasswordModel;
  ForgetPasswordSuccessState(this.forgetPasswordModel);
}

class ForgetPasswordLoadingState extends ForgetPasswordState {}

class ForgetPasswordErrorState extends ForgetPasswordState {
  final String error;
  ForgetPasswordErrorState(this.error);
}

class NewPasswordSuccessState extends ForgetPasswordState {
  final NewPasswordModel newPasswordModel;
  NewPasswordSuccessState(this.newPasswordModel);
}

class NewPasswordLoadingState extends ForgetPasswordState {}

class NewPasswordErrorState extends ForgetPasswordState {
  final String error ;
  NewPasswordErrorState(this.error);
}

class ForgetPasswordVisibleState extends ForgetPasswordState {}

class ChangePasswordVisibilityState extends ForgetPasswordState {}

