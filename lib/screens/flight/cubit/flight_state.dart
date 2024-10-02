part of 'flight_cubit.dart';

abstract class FlightState {}

//Go Flights
class FlightInitial extends FlightState {}

class FlightLoadingState extends FlightState {}

class FlightSuccessState extends FlightState {
  final GoFlightsModel goFlightsModel;
  FlightSuccessState(this.goFlightsModel);
}

class FlightErrorState extends FlightState {
  final String error;
  FlightErrorState(this.error);
}

//Book Flights

class BookFlightLoadingState extends FlightState {}

class BookFlightSuccessState extends FlightState {
  final BookFlightModel bookFlightModel;
  BookFlightSuccessState(this.bookFlightModel);
}

class BookFlightErrorState extends FlightState {
  final String error;
  BookFlightErrorState(this.error);
}

//Cancel Flights

class CancelFlightLoadingState extends FlightState {}

class CancelFlightSuccessState extends FlightState {
  final CancelFlightModel cancelFlightModel;
  CancelFlightSuccessState(this.cancelFlightModel);
}

class CancelFlightErrorState extends FlightState {
  final String error;
  CancelFlightErrorState(this.error);
}

class CancelFlight1ErrorState extends FlightState {}



//My Flights

class MyFlightBookingLoadingState extends FlightState {}

class MyFlightBookingSuccessState extends FlightState {
  final MyFlightBookingModel myFlightBookingModel;
  MyFlightBookingSuccessState(this.myFlightBookingModel);
}

class MYFlightBookingErrorState extends FlightState {
  final String error;
  MYFlightBookingErrorState(this.error);
}

//Get Flight Round

class FlightRoundLoadingState extends FlightState {}

class FlightRoundSuccessState extends FlightState {
  final List<FlightRoundModel> flightRoundModel;
  FlightRoundSuccessState(this.flightRoundModel);
}

class FlightRoundErrorState extends FlightState {
  final String error;
  FlightRoundErrorState(this.error);
}

//Book Flight Round

class BookFlightRoundLoadingState extends FlightState {}

class BookFlightRoundSuccessState extends FlightState {
  final BookFlightRoundModel bookFlightRoundModel;
  BookFlightRoundSuccessState(this.bookFlightRoundModel);
}

class BookFlightRoundErrorState extends FlightState {
  final String error;
  BookFlightRoundErrorState(this.error);
}

//Cancel Book

class CancelFlightRoundLoadingState extends FlightState {}

class CancelFlightRoundSuccessState extends FlightState {
  final CancelBookModel cancelBookModel;
  CancelFlightRoundSuccessState(this.cancelBookModel);
}

class CancelFlightRoundErrorState extends FlightState {
  final String error;
  CancelFlightRoundErrorState(this.error);
}

//My Flight Round Booked

class MyFlightRoundBookedLoadingState extends FlightState {}

class MyFlightRoundBookedSuccessState extends FlightState {
  final MyFlightRoundBookedModel myFlightRoundBookedModel;
  MyFlightRoundBookedSuccessState(this.myFlightRoundBookedModel);
}

class MyCancelFlightRoundBookedErrorState extends FlightState {
  final String error;
  MyCancelFlightRoundBookedErrorState(this.error);
}





