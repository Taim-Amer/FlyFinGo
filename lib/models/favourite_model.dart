class ChangeFavouriteModel {
  String? message;
  int? status;

  ChangeFavouriteModel({this.message, this.status});

  ChangeFavouriteModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }
}