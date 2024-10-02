part of 'email_verify_cubit.dart';

abstract class EmailVerifyState {}

class EmailVerifyInitial extends EmailVerifyState {}

class VerifyEmailLoadingState extends EmailVerifyState {}

class VerifyEmailSuccessState extends EmailVerifyState {
  final VerifyEmailModel verifyEmailModel;
  VerifyEmailSuccessState(this.verifyEmailModel);
}

class VerifyEmailErrorState extends EmailVerifyState {
  final String error;
  VerifyEmailErrorState(this.error);

}
