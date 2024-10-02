class BookFlightRoundModel {
  String? message;
  int? status;

  BookFlightRoundModel({this.message, this.status});

  BookFlightRoundModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}