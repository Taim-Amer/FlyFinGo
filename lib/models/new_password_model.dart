class NewPasswordModel {
  String? message;
  int? status;

  NewPasswordModel({this.message, this.status});

  NewPasswordModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}