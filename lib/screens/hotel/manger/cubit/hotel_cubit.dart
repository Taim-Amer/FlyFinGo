import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/add_comment_model.dart';
import 'package:travelt/models/cancel_hotel_model.dart';
import 'package:travelt/models/favourite_model.dart';
import 'package:travelt/models/get_favourite_model.dart';
import 'package:travelt/models/hotel_details_model.dart';
import 'package:travelt/models/hotel_model.dart';
import 'package:travelt/models/my_bookings_model.dart';
import 'package:travelt/models/room_booking_model.dart';
import 'package:travelt/shared/end_points.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/shared/network/remote/dio_helper.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());
  static HotelCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");
  Map<int?, bool?> favourites = {};

  HotelsModel? hotelModel;
  void showHotel({
    required String cityName,
    required int personNumber,
    required String start,
    required String end,
    required bool children,
    String sort = "normal",
  }) {
    emit(HotelLoadingState());
    DioHelper.getData(
      endpoint: HOTEL,
      bearerToken: token,
      queryParameters: {
        "cityName": cityName,
        "persons": personNumber,
        "start": start,
        "end": end,
        "children": children,
        "sort": sort
      },
    ).then((value) {
      hotelModel = HotelsModel.fromJson(value);
      hotelModel!.data!.forEach((element){
        favourites.addAll({
          element.id!: element.isFavorite!,
        });
      });
      print(favourites.toString());
      emit(HotelSuccessState(hotelModel!));
    }).catchError((onError) {
      emit(HotelErrorState(onError.toString()));
    });
  }

  HotelDetailsModel? hotelDetailsModel;
  void showHotelDetails({
    required String hotelId
  }){
    emit(HotelDetailsLoadingState());
    DioHelper.getData(
        endpoint: HOTELDETAILS,
        bearerToken: token,
        queryParameters: {
          "hotel_id" : hotelId
        }
    ).then((value){
        hotelDetailsModel = HotelDetailsModel.fromJson(value);
        emit(HotelDetailsSuccessState(hotelDetailsModel!));
    }).catchError((onError){
        emit(HotelDetailsErrorState(onError.toString()));
    });
  }

  ChangeFavouriteModel? changeFavouriteModel;
  void changeFavourite({
    required int id
  }){
    favourites[id] = !favourites[id]!;
    emit(FavouriteSuccessState());
    DioHelper.getData(
        endpoint: FAVOURITE,
        bearerToken: token,
        queryParameters: {
          "hotel_id" : id
        }
    ).then((value){
      changeFavouriteModel = ChangeFavouriteModel.fromJson(value);
      if(changeFavouriteModel!.status == 404){
        favourites[id] = !favourites[id]!;
      }
      emit(FavouriteSuccessState());
    }).catchError((onError){
      favourites[id] = !favourites[id]!;
      emit(FavouriteErrorState(onError.toString()));
    });
  }

  AddCommentModel? addCommentModel;
  void addComment({
    required String comment,
    required double rate,
    required int hotelId
  }){
    emit(HotelAddCommentLoadingState());
    DioHelper.postData(
        endpoint: COMMENT,
        data: {
          "comment" : comment,
          "rate" : rate,
          "hotel_id" : hotelId
        },
        bearerToken: token
    ).then((value) {
        addCommentModel = AddCommentModel.fromJson(value);
        emit(HotelAddCommentSuccessState(addCommentModel!));
    }).catchError((onError){
        emit(HotelAddCommentErrorState(onError.toString()));
    });
  }

  RoomBookingModel roomBookingModel = RoomBookingModel(
    message: '',
  );
  void bookRoom({
    required  int hotelId,
    required String startDate,
    required String endDate,
    required int personNumber
  }){
    emit(HotelRoomBookingLoadingState());
    DioHelper.postData(
        endpoint: BOOK,
        data: {
          "hotel_id": hotelId,
          "start": startDate,
          "end": endDate,
          "persons": personNumber
        },
        bearerToken: token,
    ).then((value){
      roomBookingModel = RoomBookingModel.fromJson(value);
      emit(HotelRoomBookingSuccessState(roomBookingModel));
    }).catchError((onError){
      emit(HotelRoomBookingErrorState(onError.toString()));
    });
  }

  MyBookingsModel? myBookingsModel;
  void getMyBookings(){
    emit(HotelMyBookingLoadingState());
    DioHelper.getData(
        endpoint: MYBOOK,
        bearerToken: token,
    ).then((value){
      myBookingsModel = MyBookingsModel.fromJson(value);
      emit(HotelMyBookingSuccessState(myBookingsModel!));
    }).catchError((onError){
      emit(HotelMyBookingErrorState(onError.toString()));
    });
  }

  MyFavouriteModel? myFavouriteModel;
  void getFavourite(){
    emit(HotelMyFavouriteLoadingState());
    DioHelper.getData(
        endpoint: MYFAVOURITE,
        bearerToken: token
    ).then((value){
      myFavouriteModel = MyFavouriteModel.fromJson(value!);
    }).catchError((onError){
      emit(HotelMyFavouriteErrorState(onError.toString()));
    });
  }
//{
//     "hotel_id":2,
//     "room_id":3,
//     "start":"2024-08-17",
//     "end":"2024-08-28"
// }
  CancelHotelModel?cancelHotelModel;
  void cancelHotel({
    required int hotelId,
    required int roomId,
    required String startDate,
    required String endDate
  }){
    emit(CancelHotelLoadingState());
    DioHelper.deleteData(
        endpoint: "cancelBook",
        bearerToken: token
    ).then((value){
      cancelHotelModel = CancelHotelModel.fromJson(value);
      emit(CancelHotelSuccessState(cancelHotelModel!));
    }).catchError((onError){
      print(onError.toString());
      emit(CancelHotelErrorState(onError.toString()));
    });
  }
}
