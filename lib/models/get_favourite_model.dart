class MyFavouriteModel {
  List<Data>? data;
  int? status;

  MyFavouriteModel({this.data, this.status});

  MyFavouriteModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
  }
}

class Data {
  int? id;
  String? name;
  String? phoneHotel;
  int? rate;
  int? price;
  String? description;
  double? latitude;
  double? longitude;
  int? cityId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Data(
      {this.id,
        this.name,
        this.phoneHotel,
        this.rate,
        this.price,
        this.description,
        this.latitude,
        this.longitude,
        this.cityId,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneHotel = json['phone_hotel'];
    rate = json['rate'];
    price = json['price'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
}

class Pivot {
  int? userId;
  int? hotelId;

  Pivot({this.userId, this.hotelId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    hotelId = json['hotel_id'];
  }
}