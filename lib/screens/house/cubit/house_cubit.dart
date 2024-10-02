import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/book_house_model.dart';
import 'package:travelt/models/change_booking_status.dart';
import 'package:travelt/models/change_house_favourite_model.dart';
import 'package:travelt/models/get_house_favourite_model.dart';
import 'package:travelt/models/inside_house_model.dart';
import 'package:travelt/models/my_house_booking_model.dart';
import 'package:travelt/models/new_house_model.dart';
import 'package:travelt/models/show_house_model.dart';
import 'package:travelt/models/show_user_house_booking_model.dart';
import 'package:travelt/models/show_user_houses_model.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/shared/network/remote/dio_helper.dart';

part 'house_state.dart';

class HouseCubit extends Cubit<HouseState> {
  HouseCubit() : super(HouseInitial());

  static HouseCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");
  Map<int?, bool?> favourites = {};
  bool isFav = false ;

  ShowHousesModel? showHousesModel;
  void showHouses({
    required String cityName,
    required int minSpace,
    required int maxSpace,
    required int rooms,
    required String start,
    required int months
  }){
    emit(ShowHousesLoadingState());
    DioHelper.getData(
      endpoint: "homes",
      bearerToken: token,
      queryParameters:  {
        "cityName":cityName,
        "minSpace" : minSpace,
        "maxSpace" : maxSpace,
        "rooms": rooms ,
        "start": start,
        "months" : months
      }
    ).then((value){
      showHousesModel = ShowHousesModel.fromJson(value);
      print(showHousesModel!.status);
      print(showHousesModel!.status);
      print(showHousesModel!.status);
      emit(ShowHousesSuccessState(showHousesModel!));
    }).catchError((onError){

      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
      emit(ShowHousesErrorState(onError.toString()));
    });
  }

  NewHouseModel? newHouseModel;
  void addNewHouse({
    required  int space ,
    required String location,
    required String description,
    required int monthlyRent ,
    required int personNumber,
    required int rooms,
    required int baths,
    required int cityId
  }){
    emit(AddNewHouseLoadingState());
    DioHelper.postData(
        endpoint: "userHomes/addHome",
        bearerToken: token,
        data: {
          "space": space,
          "location": location,
          "description": description,
          "monthly_rent": monthlyRent,
          "person_num": personNumber,
          "rooms": rooms,
          "baths": baths,
          "city_id": cityId
        },
    ).then((value){
      newHouseModel = NewHouseModel.fromJson(value);
      print(newHouseModel!.message);
      print(newHouseModel!.message);
      print(newHouseModel!.message);
      print(newHouseModel!.message);

      emit(AddNewHouseSuccessState(newHouseModel!));
    }).catchError((onError){
      emit(AddNewHouseErrorState(onError.toString()));
    });
  }

  // ShowUserHousesModel? showUserHousesModel;
  // void showUserHouses(){
  //   emit(ShowUserHousesLoadingState());
  //   DioHelper.getData(
  //       endpoint: "UserHomes/homes",
  //       bearerToken: token,
  //   ).then((value){
  //     showUserHousesModel = ShowUserHousesModel.fromJson(value);
  //     print(showUserHousesModel!.unverifiedHomes!.first!.cityId);
  //     print(showUserHousesModel!.unverifiedHomes!.first!.cityId);
  //     print(showUserHousesModel!.unverifiedHomes!.first!.cityId);
  //     print(showUserHousesModel!.unverifiedHomes!.first!.cityId);
  //
  //     emit(ShowUserHousesSuccessState(showUserHousesModel!));
  //   }).catchError((onError){
  //     emit(ShowUserHousesErrorState(onError.toString()));
  //   });
  // }

  // ShowUserHouseBookingModel? showUserHouseBookingModel;
  // void showUserHousesBooking({
  //   required int homeId,
  //   required String sort,
  // }){
  //   emit(ShowUserHousesBookingLoadingState());
  //   DioHelper.getData(
  //     endpoint: "UserHomes/bookings",
  //     bearerToken: token,
  //     queryParameters:   {
  //       "home_id":homeId,
  //       "sort": sort
  //     }
  //   ).then((value){
  //     showUserHouseBookingModel = ShowUserHouseBookingModel.fromJson(value.data);
  //     print(showUserHouseBookingModel!.status);
  //     print(showUserHouseBookingModel!.status);
  //     print(showUserHouseBookingModel!.status);
  //     print(showUserHouseBookingModel!.status);
  //     print(showUserHouseBookingModel!.status);
  //
  //     emit(ShowUserHousesSuccessState(showUserHousesModel!));
  //   }).catchError((onError){
  //     emit(ShowUserHousesBookingErrorState(onError.toString()));
  //   });
  // }

  // ChangeBookingStatusModel? changeBookingStatusModel;
  // void changeBookingStatus({
  //   required int bookingId,
  //   required String status
  // }){
  //   emit(ChangeBookingStatusLoadingState());
  //   DioHelper.postData(
  //       endpoint: "UserHomes/booking/change-status",
  //       bearerToken: token,
  //       data:   {
  //         "booking_id":bookingId,
  //         "booking_status": status
  //       },
  //   ).then((value){
  //     changeBookingStatusModel = ChangeBookingStatusModel.fromJson(value);
  //     print(changeBookingStatusModel!.status);
  //     print(changeBookingStatusModel!.status);
  //     print(changeBookingStatusModel!.status);
  //     print(changeBookingStatusModel!.status);
  //
  //     emit(ChangeBookingStatusSuccessState(changeBookingStatusModel!));
  //   }).catchError((onError){
  //     emit(ChangeBookingStatusErrorState(onError.toString()));
  //   });
  // }

  MyHouseBookingModel? myHouseBookingModel;
  void getMyHouseBooking(){
    emit(MyHouseBookingLoadingState());
    DioHelper.getData(
        endpoint: "homes/myHomeBookings",
        bearerToken: token,
    ).then((value){
      myHouseBookingModel = MyHouseBookingModel.fromJson(value);

      print(myHouseBookingModel!.data!.first.homeId);
      print(myHouseBookingModel!.data!.first.homeId);
      print(myHouseBookingModel!.data!.first.homeId);
      print(myHouseBookingModel!.data!.first.homeId);

      emit(MyHouseBookingSuccessState(myHouseBookingModel!));
    }).catchError((onError){
      emit(MyHouseBookingErrorState(onError.toString()));
    });
  }
  
  BookHouseModel? bookHouseModel;
  void bookHouse({
    required int homeId,
    required String start,
    required int months
  }){
    emit(BookHouseLoadingState());
    DioHelper.postData(
        endpoint: "bookHome",
        bearerToken: token,
        data: {
          "home_id":homeId,
          "start": start,
          "months":months
        },
    ).then((value){
      bookHouseModel = BookHouseModel.fromJson(value);
      print(bookHouseModel!.message);
      print(bookHouseModel!.message);
      print(bookHouseModel!.message);
      print(bookHouseModel!.message);

      emit(BookHouseSuccessState(bookHouseModel!));
    }).catchError((onError){
      print(onError.toString());
      emit(BookHouseErrorState(onError.toString()));
    });
  }

  InsideHouseModel? insideHouseModel;
  Future<void> insideHousePage({
    required int homeId
  })async{
    emit(InsideHousePageLoadingState());
    DioHelper.getData(
        endpoint: "InsideHomePage",
        bearerToken: token,
        queryParameters: {
          "home_id" : homeId
        }
    ).then((value){
      insideHouseModel = InsideHouseModel.fromJson(value);
      print(insideHouseModel!.status);
      print(insideHouseModel!.status);
      print(insideHouseModel!.status);
      print(insideHouseModel!.status);

      emit(InsideHousePageSuccessState(insideHouseModel!));
    }).catchError((onError){
      emit(InsideHousePageErrorState(onError.toString()));
    });
  }

  late ChangeHouseFavouriteModel changeHouseFavouriteModel;
  void changeHouseFavourite({
    required int homeId,
  }){
    // favourites[homeId] = !favourites[homeId]!;
    isFav = !isFav;
    emit(ChangeHouseFavouriteSuccessState());
    DioHelper.getData(
        endpoint: "addRemoveHomeToFav",
        bearerToken: token,
        queryParameters: {
          "home_id": homeId
        }
    ).then((value){
      changeHouseFavouriteModel = ChangeHouseFavouriteModel.fromJson(value);
      // if(changeHouseFavouriteModel!.status == 404){
      //   favourites[homeId] = !favourites[homeId]!;
      // }
      // isFav = !isFav;
      emit(ChangeHouseFavouriteSuccessState());
    }).catchError((onError){
      // favourites[homeId] = !favourites[homeId]!;
      emit(ChangeHouseFavouriteErrorState(onError.toString()));
    });
  }


}
