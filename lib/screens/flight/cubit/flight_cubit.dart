import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/book_flight_model.dart';
import 'package:travelt/models/book_flight_round_model.dart';
import 'package:travelt/models/cancel_book_model.dart';
import 'package:travelt/models/cancel_flight_model.dart';
import 'package:travelt/models/flight_round_model.dart';
import 'package:travelt/models/go_flights_model.dart';
import 'package:travelt/models/my_flight_booking_model.dart';
import 'package:travelt/models/my_flight_round_booked_model.dart';
import 'package:travelt/shared/end_points.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/shared/network/remote/dio_helper.dart';

part 'flight_state.dart';

class FlightCubit extends Cubit<FlightState> {
  FlightCubit() : super(FlightInitial());
  static FlightCubit get(context) => BlocProvider.of(context);
  String token = CacheHelper.getData(key: "token");

  GoFlightsModel? goFlightsModel;
  void showFlight({
    required String fromCity,
    required String toCity,
    required int personNumber,
    required String date,
    required String period
  }){
    emit(FlightLoadingState());
    DioHelper.getData(
        endpoint: FLIGHTSGO,
        bearerToken: token,
        queryParameters: {
          "from_city":fromCity,
          "to_city":toCity,
          "persons":personNumber,
          "date":date,
          "period":period
        }
    ).then((value){
      goFlightsModel = GoFlightsModel.fromJson(value!);
      emit(FlightSuccessState(goFlightsModel!));
    }).catchError((onError){
      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
      emit(FlightErrorState(onError.toString()));
    });
  }

  BookFlightModel? bookFlightModel;
  void bookFlight({
    required int personNumber,
    required int classId,
    required int flightGoId,
  }){
    emit(BookFlightLoadingState());
    DioHelper.getData(
        endpoint: BOOKFLIGHTS,
        bearerToken: token,
        queryParameters: {
          "person": personNumber,
          "class_id": classId,
          "flightGo_id": flightGoId
        }
    ).then((value){
      bookFlightModel = BookFlightModel.fromJson(value);

      emit(BookFlightSuccessState(bookFlightModel!));
    }).catchError((onError){
      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
      print(onError.toString());
      emit(BookFlightErrorState(onError.toString()));
    });
  }

  late CancelFlightModel cancelFlightModel;
  void cancelFlightGo({
    required int classId,
    required int flightGoID,
    required int passengerNumber
  }){
    emit(CancelFlightLoadingState());
    DioHelper.deleteData(
        endpoint: CANCELFLIGHTS,
        bearerToken: token,
        queryParameters: {
          "class_id": classId,
          "flightGo_id": flightGoID,
          "passenger": passengerNumber
        }
    ).then((value){
      const Duration(seconds: 5);

      cancelFlightModel = CancelFlightModel.fromJson(value);
      print(cancelFlightModel!.status);
      print(cancelFlightModel!.status);
      print(cancelFlightModel!.status);
      print(cancelFlightModel!.status);

      // if( == 404){
      //   emit(CancelFlight1ErrorState());
      // }

      emit(CancelFlightSuccessState(cancelFlightModel));
    }).catchError((onError){
      print(onError.toString());
      emit(CancelFlightErrorState(onError.toString()));
    });
  }

  late MyFlightBookingModel myFlightBookingModel;
  void getMyFlightBooking(){
    emit(MyFlightBookingLoadingState());
    DioHelper.getData(
        endpoint: MYFLIGHTBOOKING,
        bearerToken: token
    ).then((value){
      myFlightBookingModel = MyFlightBookingModel.fromJson(value);
      print(myFlightBookingModel!.status);
      print(myFlightBookingModel!.status);
      print(myFlightBookingModel!.status);

      emit(MyFlightBookingSuccessState(myFlightBookingModel!));
    }).catchError((onError){
      emit(MYFlightBookingErrorState(onError.toString()));
    });
  }
  
  // late FlightRoundModel flightRoundModel;
  // void getFlightRound({
  //   required String fromCity,
  //   required String toCity,
  //   required int personNumber,
  //   required String dateGo,
  //   required String dateBack,
  //   // required String classs,
  //   // required int minValue,
  //   // required int maxValue,
  // }){
  //   emit(FlightRoundLoadingState());
  //   DioHelper.getData(
  //       endpoint: FLIGHTROUND,
  //       bearerToken: token,
  //       queryParameters: {
  //         "from_city": fromCity,
  //         "to_city": toCity,
  //         "persons": personNumber,
  //         "dateGo": dateGo,
  //         "dateBack": dateBack,
  //         "class":"First class",
  //         "min_val":80,
  //         "max_val":160
  //       }
  //   ).then((value){
  //     flightRoundModel = FlightRoundModel.fromJson(value);
  //
  //     print(flightRoundModel!.id);
  //     print(flightRoundModel!.id);
  //     print(flightRoundModel!.id);
  //     print(flightRoundModel!.id);
  //
  //     emit(FlightRoundSuccessState(flightRoundModel!));
  //   }).catchError((onError){
  //     emit(FlightRoundErrorState(onError.toString()));
  //   });
  // }
  late List<FlightRoundModel> flightRoundModels;
  void getFlightRound({
    required String fromCity,
    required String toCity,
    required int personNumber,
    required String dateGo,
    required String dateBack,
  }) {
    emit(FlightRoundLoadingState());
    DioHelper.getData(
      endpoint: FLIGHTROUND,
      bearerToken: token,
      queryParameters: {
        "from_city": fromCity,
        "to_city": toCity,
        "persons": personNumber,
        "dateGo": dateGo,
        "dateBack": dateBack,
        "class": "First class",
        "min_val": 80,
        "max_val": 160
      },
    ).then((value) {
      flightRoundModels = (value as List).map((item) => FlightRoundModel.fromJson(item)).toList();
      emit(FlightRoundSuccessState(flightRoundModels));
    }).catchError((onError) {
      emit(FlightRoundErrorState(onError.toString()));
    });
  }


  BookFlightRoundModel? bookFlightRoundModel;
  void bookFlightRound({
      required int personNumber,
      required int classId,
      required int flightRoundId,
  }){
    emit(BookFlightRoundLoadingState());
    DioHelper.postData(
        endpoint: BOOKFLIGHTROUND,
        data:   {
          "person": personNumber,
          "class_id": classId,
          "flightRound_id": flightRoundId
        },
        bearerToken: token
    ).then((value){
      bookFlightRoundModel = BookFlightRoundModel.fromJson(value);

      print(bookFlightRoundModel!.status);
      print(bookFlightRoundModel!.status);
      print(bookFlightRoundModel!.status);
      print(bookFlightRoundModel!.status);

      emit(BookFlightRoundSuccessState(bookFlightRoundModel!));
    }).catchError((onError){
      print(onError.toString());
      emit(BookFlightRoundErrorState(onError.toString()));
    });
  }

  CancelBookModel? cancelBookModel;
  void cancelBook({
    required int id
  }){
    emit(CancelFlightRoundLoadingState());
    DioHelper.deleteData(
        endpoint: CANCELBOOK,
        bearerToken: token,
        queryParameters: {
          "id": id
        }
    ).then((value){
      cancelBookModel = CancelBookModel.fromJson(value);

      print(cancelBookModel!.status);
      print(cancelBookModel!.status);
      print(cancelBookModel!.status);
      print(cancelBookModel!.status);

      emit(CancelFlightRoundSuccessState(cancelBookModel!));
    }).catchError((onError){
      emit(CancelFlightRoundErrorState(onError.toString()));
    });
  }

  MyFlightRoundBookedModel? myFlightRoundBookedModel;
  void myFlightRoundBooked(){
    emit(MyFlightRoundBookedLoadingState());
    DioHelper.getData(
        endpoint: MYFLIGHTROUNDBOOKED,
        bearerToken: token,
    ).then((value){
      myFlightRoundBookedModel = MyFlightRoundBookedModel.fromJson(value.data);

      print(myFlightRoundBookedModel!.status);
      print(myFlightRoundBookedModel!.status);
      print(myFlightRoundBookedModel!.status);
      print(myFlightRoundBookedModel!.status);

      emit(MyFlightRoundBookedSuccessState(myFlightRoundBookedModel!));
    }).catchError((onError){
      emit(MyCancelFlightRoundBookedErrorState(onError.toString()));
    });
  }
}
