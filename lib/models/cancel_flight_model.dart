class CancelFlightModel {
  String? message;
  int? status;

  CancelFlightModel({this.message, this.status});

  CancelFlightModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}