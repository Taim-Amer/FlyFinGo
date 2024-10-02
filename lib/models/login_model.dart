class LoginModel {
  String? token;
  String? message;
  int? status;

  LoginModel({this.token, this.message, this.status});

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    message = json['message'];
    status = json['status'];
  }
}