import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/models/forget_password_model.dart';
import 'package:travelt/models/new_password_model.dart';
import 'package:travelt/shared/end_points.dart';
import 'package:travelt/shared/network/remote/dio_helper.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  late ForgetPasswordModel forgetPasswordModel;
  bool isVisible = false;

  void forgetPassword({
    required String email,
  }) {
    emit(ForgetPasswordLoadingState());
    DioHelper.postData(endpoint: FORGETPASSWORD, data: {"email": email})
        .then((value) {
      forgetPasswordModel = ForgetPasswordModel.fromJson(value);
      isVisible = true;
      emit(ForgetPasswordSuccessState(forgetPasswordModel));
      emit(ForgetPasswordVisibleState());
    }).catchError((onError) {
      if (onError is DioException) {
        if (onError.response != null) {
          final errorMessage = onError.response!.data['message']['email'][0];
          emit(ForgetPasswordErrorState(errorMessage));
        } else {
          emit(ForgetPasswordErrorState(onError.message.toString()));
        }
      } else {
        emit(ForgetPasswordErrorState(onError.toString()));
      }
    });
  }

  late NewPasswordModel newPasswordModel;

  void resetPassord(
      {required String email,
      required String password,
      required String passwordConfirmation,
      required String code}) {
    emit(NewPasswordLoadingState());
    DioHelper.postData(endpoint: NEWPASSWORD, data: {
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "code": code,
    }).then((value) {
      newPasswordModel = NewPasswordModel.fromJson(value);
      emit(NewPasswordSuccessState(newPasswordModel));
    }).catchError((onError) {
      print(onError.toString());
      //emit(NewPasswordErrorState(onError.toString()));
      if (onError is DioException) {
        if (onError.response != null) {
          final errorMessage = onError.response!.data['message'];
          emit(NewPasswordErrorState(errorMessage));
        } else {
          emit(NewPasswordErrorState(onError.message.toString()));
        }
      } else {
        emit(NewPasswordErrorState(onError.toString()));
      }
    });
  }

  IconData suffix = Iconsax.eye_slash;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Iconsax.eye_slash : Iconsax.eye;
    emit(ChangePasswordVisibilityState());
  }
}
