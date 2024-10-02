class RegisterModel {
  String? message;
  int? status;

  RegisterModel({this.message, this.status});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}