class GetHouseFavouriteModel {
  List<Data>? data;
  int? status;

  GetHouseFavouriteModel({this.data, this.status});

  GetHouseFavouriteModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  int? space;
  String? location;
  String? description;
  int? monthlyRent;
  int? personNum;
  int? rooms;
  int? baths;
  int? userOwnerId;
  int? cityId;
  String? verificationStatus;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Data(
      {this.id,
        this.space,
        this.location,
        this.description,
        this.monthlyRent,
        this.personNum,
        this.rooms,
        this.baths,
        this.userOwnerId,
        this.cityId,
        this.verificationStatus,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    space = json['space'];
    location = json['location'];
    description = json['description'];
    monthlyRent = json['monthly_rent'];
    personNum = json['person_num'];
    rooms = json['rooms'];
    baths = json['baths'];
    userOwnerId = json['user_owner_id'];
    cityId = json['city_id'];
    verificationStatus = json['Verification_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['space'] = this.space;
    data['location'] = this.location;
    data['description'] = this.description;
    data['monthly_rent'] = this.monthlyRent;
    data['person_num'] = this.personNum;
    data['rooms'] = this.rooms;
    data['baths'] = this.baths;
    data['user_owner_id'] = this.userOwnerId;
    data['city_id'] = this.cityId;
    data['Verification_status'] = this.verificationStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  int? userId;
  int? homeId;

  Pivot({this.userId, this.homeId});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    homeId = json['home_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['home_id'] = this.homeId;
    return data;
  }
}