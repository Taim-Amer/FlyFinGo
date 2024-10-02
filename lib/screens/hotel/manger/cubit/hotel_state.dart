part of 'hotel_cubit.dart';

abstract class HotelState {}

class HotelInitial extends HotelState {}

class HotelLoadingState extends HotelState {}

class HotelSuccessState extends HotelState {
  final HotelsModel hotelModel;
  HotelSuccessState(this.hotelModel);
}

class HotelErrorState extends HotelState {
  final String error;
  HotelErrorState(this.error);
}

//Hotel Details

class HotelDetailsLoadingState extends HotelState {}

class HotelDetailsSuccessState extends HotelState {
  final HotelDetailsModel hotelDetailsModel;
  HotelDetailsSuccessState(this.hotelDetailsModel);
}

class HotelDetailsErrorState extends HotelState {
  final String error;
  HotelDetailsErrorState(this.error);
}

//Favourite

class FavouriteLoadingState extends HotelState {}

class FavouriteSuccessState extends HotelState {}

class FavouriteErrorState extends HotelState {
  final String error;
  FavouriteErrorState(this.error);
}

//Add Comment

class HotelAddCommentLoadingState extends HotelState {}

class HotelAddCommentSuccessState extends HotelState {
  final AddCommentModel addCommentModel;
  HotelAddCommentSuccessState(this.addCommentModel);
}

class HotelAddCommentErrorState extends HotelState {
  final String error;
  HotelAddCommentErrorState(this.error);
}

//Room Booking

class HotelRoomBookingLoadingState extends HotelState {}

class HotelRoomBookingSuccessState extends HotelState {
  final RoomBookingModel roomBookingModel;
  HotelRoomBookingSuccessState(this.roomBookingModel);
}

class HotelRoomBookingErrorState extends HotelState {
  final String error;
  HotelRoomBookingErrorState(this.error);
}

//My Bookings

class HotelMyBookingLoadingState extends HotelState {}

class HotelMyBookingSuccessState extends HotelState {
  final MyBookingsModel myBookingsModel;
  HotelMyBookingSuccessState(this.myBookingsModel);
}

class HotelMyBookingErrorState extends HotelState {
  final String error;
  HotelMyBookingErrorState(this.error);
}

// My Favourite

class HotelMyFavouriteLoadingState extends HotelState {}

class HotelMyFavouriteSuccessState extends HotelState {
  final MyFavouriteModel myFavouriteModel;
  HotelMyFavouriteSuccessState(this.myFavouriteModel);
}

class HotelMyFavouriteErrorState extends HotelState {
  final String error;
  HotelMyFavouriteErrorState(this.error);
}

// Cancel

class CancelHotelLoadingState extends HotelState {}

class CancelHotelSuccessState extends HotelState {
  final CancelHotelModel cancelHotelModel;
  CancelHotelSuccessState(this.cancelHotelModel);
}

class CancelHotelErrorState extends HotelState {
  final String error;
  CancelHotelErrorState(this.error);
}
