import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/verify_email_model.dart';
import 'package:travelt/shared/end_points.dart';
import 'package:travelt/shared/network/remote/dio_helper.dart';

part 'email_verify_state.dart';

class EmailVerifyCubit extends Cubit<EmailVerifyState> {
  EmailVerifyCubit() : super(EmailVerifyInitial());
  static EmailVerifyCubit get(context) => BlocProvider.of(context);

  VerifyEmailModel? verifyEmailModel;

  void verifyEmail({
    required String email,
    required String code,
  }){
    emit(VerifyEmailLoadingState());
    DioHelper.postData(
        endpoint: VERIFY,
        data: {
          "email" : email,
          "code" : code,
        }
    ).then((value){
      verifyEmailModel = VerifyEmailModel.fromJson(value);
      emit(VerifyEmailSuccessState(verifyEmailModel!));
    }).catchError((onError){
      print(onError.toString());
      emit(VerifyEmailErrorState(onError.toString()));
    });
  }
}
