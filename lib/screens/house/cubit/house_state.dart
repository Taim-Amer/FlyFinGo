part of 'house_cubit.dart';

abstract class HouseState {}

class HouseInitial extends HouseState {}

//Show Houses

class ShowHousesLoadingState extends HouseState {}

class ShowHousesSuccessState extends HouseState {
  final ShowHousesModel showHousesModel;
  ShowHousesSuccessState(this.showHousesModel);
}

class ShowHousesErrorState extends HouseState {
  final String error;

  ShowHousesErrorState(this.error);
}

//Add new house

class AddNewHouseLoadingState extends HouseState {}

class AddNewHouseSuccessState extends HouseState {
  final NewHouseModel newHouseModel;
  AddNewHouseSuccessState(this.newHouseModel);
}

class AddNewHouseErrorState extends HouseState {
  final String error;

  AddNewHouseErrorState(this.error);
}

//Show User Houses

// class ShowUserHousesLoadingState extends HouseState {}
//
// class ShowUserHousesSuccessState extends HouseState {
//   final ShowUserHousesModel showUserHousesModel;
//   ShowUserHousesSuccessState(this.showUserHousesModel);
// }
//
// class ShowUserHousesErrorState extends HouseState {
//   final String error;
//
//   ShowUserHousesErrorState(this.error);
// }

//Show User houses Booking

// class ShowUserHousesBookingLoadingState extends HouseState {}
//
// class ShowUserHousesBookingSuccessState extends HouseState {
//   final ShowUserHouseBookingModel showUserHouseBookingModel;
//   ShowUserHousesBookingSuccessState(this.showUserHouseBookingModel);
// }
//
// class ShowUserHousesBookingErrorState extends HouseState {
//   final String error;
//
//   ShowUserHousesBookingErrorState(this.error);
// }

//Change Booking Status

// class ChangeBookingStatusLoadingState extends HouseState {}
//
// class ChangeBookingStatusSuccessState extends HouseState {
//   final ChangeBookingStatusModel changeBookingStatusModel;
//   ChangeBookingStatusSuccessState(this.changeBookingStatusModel);
// }
//
// class ChangeBookingStatusErrorState extends HouseState {
//   final String error;
//
//   ChangeBookingStatusErrorState(this.error);
// }

//My House Booking

class MyHouseBookingLoadingState extends HouseState {}

class MyHouseBookingSuccessState extends HouseState {
  final MyHouseBookingModel myHouseBookingModel;
  MyHouseBookingSuccessState(this.myHouseBookingModel);
}

class MyHouseBookingErrorState extends HouseState {
  final String error;

  MyHouseBookingErrorState(this.error);
}

//Book House

class BookHouseLoadingState extends HouseState {}

class BookHouseSuccessState extends HouseState {
  final BookHouseModel bookHouseModel;
  BookHouseSuccessState(this.bookHouseModel);
}

class BookHouseErrorState extends HouseState {
  final String error;

  BookHouseErrorState(this.error);
}

//Inside House Page

class InsideHousePageLoadingState extends HouseState {}

class InsideHousePageSuccessState extends HouseState {
  final InsideHouseModel insideHouseModel;
  InsideHousePageSuccessState(this.insideHouseModel);
}

class InsideHousePageErrorState extends HouseState {
  final String error;

  InsideHousePageErrorState(this.error);
}

//Change House Favourite

class ChangeHouseFavouriteLoadingState extends HouseState {}

class ChangeHouseFavouriteSuccessState extends HouseState {
  // final int id;
  // ChangeHouseFavouriteSuccessState(this.id);
  // final ChangeHouseFavouriteModel changeHouseFavouriteModel;
  // ChangeHouseFavouriteSuccessState(this.changeHouseFavouriteModel);
}

class ChangeHouseFavouriteErrorState extends HouseState {
  final String error;

  ChangeHouseFavouriteErrorState(this.error);
}

//Get House FAvourite

class GetHouseFavouriteLoadingState extends HouseState {}

class GetHouseFavouriteSuccessState extends HouseState {
  final GetHouseFavouriteModel getHouseFavouriteModel;
  GetHouseFavouriteSuccessState(this.getHouseFavouriteModel);
}

class GetHouseFavouriteErrorState extends HouseState {
  final String error;
  GetHouseFavouriteErrorState(this.error);
}





