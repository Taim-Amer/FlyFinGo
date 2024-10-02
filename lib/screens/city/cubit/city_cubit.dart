  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:travelt/models/city_model.dart';
  import 'package:travelt/models/city_search_model.dart';
  import 'package:travelt/shared/end_points.dart';
  import 'package:travelt/shared/network/remote/dio_helper.dart';

  part 'city_state.dart';

  class CityCubit extends Cubit<CityState> {
    CityCubit() : super(CityInitial());
    static CityCubit get(context) => BlocProvider.of(context);

    CityModel? cityModel;
    void getCities(){
      emit(CitiesLoadingState());
      DioHelper.getData(
          endpoint: CITIES,
      ).then((value){
        cityModel = CityModel.fromJson(value);
        emit(CitiesSuccessState(cityModel!));
      }).catchError((onError){

        emit(CitiesErrorState(onError.toString()));
      });
    }

    CitySearchModel? citySearchModel;
    void searchCity({
      required String cityName
    }){
       emit(CitiesSearchLoadingState());
       DioHelper.getData(
           endpoint: CITYSEARCH,
           queryParameters: {
             "search": cityName
           }
       ).then((value) {
          citySearchModel = CitySearchModel.fromJson(value.data);
          emit(CitiesSearchSuccessState(citySearchModel!));
       }).catchError((onError){
         print(onError.toString());
         print(onError.toString());
         print(onError.toString());
         emit(CitiesSearchErrorState(onError.toString()));
       });
    }
  }
