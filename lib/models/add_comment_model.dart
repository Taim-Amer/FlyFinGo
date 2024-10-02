class AddCommentModel {
  String? message;
  int? status;

  AddCommentModel({this.message, this.status});

  AddCommentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}