class RoomBookingModel {
  String? message;

  RoomBookingModel({this.message});

  RoomBookingModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}