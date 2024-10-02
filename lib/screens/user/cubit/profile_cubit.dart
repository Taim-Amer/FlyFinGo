import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/profile_model.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/shared/network/remote/dio_helper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");

  ProfileModel profileModel = ProfileModel();
  void getProfile(){
    emit(ProfileLoadingState());
    DioHelper.getData(
        endpoint: "profile/user",
        bearerToken: token
    ).then((value){
      profileModel = ProfileModel.fromJson(value);
      emit(ProfileSuccessState(profileModel));

    }).catchError((onError){
      print(onError.toString());
      emit(ProfileErrorState(onError.toString()));
    });
  }
}
