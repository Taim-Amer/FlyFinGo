class VerifyEmailModel {
  String? message;
  String? token;
  int? status;

  VerifyEmailModel({this.message, this.token, this.status});

  VerifyEmailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    status = json['status'];
  }
}