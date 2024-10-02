class MyHouseBookingModel {
  List<Data>? data;

  MyHouseBookingModel({this.data});

  MyHouseBookingModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? bookingStatus;
  String? start;
  String? end;
  int? total;
  int? homeId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  Home? home;

  Data(
      {this.id,
        this.bookingStatus,
        this.start,
        this.end,
        this.total,
        this.homeId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.home});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingStatus = json['booking_status'];
    start = json['start'];
    end = json['end'];
    total = json['total'];
    homeId = json['home_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    home = json['home'] != null ? new Home.fromJson(json['home']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_status'] = this.bookingStatus;
    data['start'] = this.start;
    data['end'] = this.end;
    data['total'] = this.total;
    data['home_id'] = this.homeId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    return data;
  }
}

class Home {
  int? id;
  String? location;
  int? space;

  Home({this.id, this.location, this.space});

  Home.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    space = json['space'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['location'] = this.location;
    data['space'] = this.space;
    return data;
  }
}