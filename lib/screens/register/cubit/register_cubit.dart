import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/models/register_model.dart';
import 'package:travelt/shared/end_points.dart';
import 'package:travelt/shared/network/remote/dio_helper.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  late RegisterModel registerModel;

  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  }){
    emit(RegisterLoadingState());
    DioHelper.postData(
        endpoint: REGISTER,
        data: {
          "name" : name,
          "email" : email,
          "phone" : phone,
          "password" : password,
        },
    ).then((value) {
      registerModel = RegisterModel.fromJson(value);
      emit(RegisterSuccessState(registerModel));
    }).catchError((onError){
      if (onError is DioException) {
        if (onError.response != null) {
          final errorMessage = onError.response!.data['message'];
          emit(RegisterErrorState(errorMessage));
        } else {
          emit(RegisterErrorState(onError.message.toString()));
        }
      }
      else {
        emit(RegisterErrorState(onError.toString()));
      }
    });
  }
  IconData suffix = Iconsax.eye_slash;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Iconsax.eye_slash : Iconsax.eye;

    emit(ChangePasswordVisibilityState());
  }
}
