import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/models/login_model.dart';
import 'package:travelt/shared/end_points.dart';
import 'package:travelt/shared/network/remote/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;

  void userLogin({
    required String email,
    required String password,
  }){
    emit(LoginLoadingState());
    DioHelper.postData(
        endpoint: LOGIN,
        data: {
          "email" : email,
          "password" : password
        },
    ).then((value){
      loginModel = LoginModel.fromJson(value);
      emit(LoginSuccesState(loginModel));
    }).catchError((onError){
      if (onError is DioException) {
        if (onError.response != null) {
          final errorMessage = onError.response!.data['message'];
          emit(LoginErrorState(errorMessage));
        } else {
          emit(LoginErrorState(onError.message.toString()));
        }
      }
      else {
        emit(LoginErrorState(onError.toString()));
      }
    });
  }

  IconData suffix = Iconsax.eye_slash;
  bool isPassword =  true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Iconsax.eye_slash : Iconsax.eye;
    emit(ChangePasswordVisibilityState());
  }
}
