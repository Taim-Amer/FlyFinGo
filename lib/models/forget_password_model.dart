class ForgetPasswordModel {
  String? message;
  int? status;

  ForgetPasswordModel({this.message, this.status});

  ForgetPasswordModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}