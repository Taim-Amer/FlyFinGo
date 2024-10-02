part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccesState extends LoginState {
  final LoginModel loginModel;
  LoginSuccesState(this.loginModel);
}

class LoginErrorState extends LoginState {
  final String error;
  LoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends LoginState {}
