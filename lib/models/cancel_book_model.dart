class CancelBookModel {
  String? message;
  int? status;

  CancelBookModel({this.message, this.status});

  CancelBookModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}