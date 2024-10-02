class BookFlightModel {
  String? message;
  int? status;

  BookFlightModel({this.message, this.status});

  BookFlightModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}