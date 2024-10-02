class ShowHousesModel {
  List<Data>? data;
  int? status;

  ShowHousesModel({this.data, this.status});

  ShowHousesModel.fromJson(Map<String, dynamic> json) {
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
  List<HomeBookings>? homeBookings;
  bool? isFavorite;
  String? photoUrl;

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
        this.homeBookings,
        this.isFavorite,
        this.photoUrl});

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
    if (json['home_bookings'] != null) {
      homeBookings = <HomeBookings>[];
      json['home_bookings'].forEach((v) {
        homeBookings!.add(new HomeBookings.fromJson(v));
      });
    }
    isFavorite = json['isFavorite'];
    photoUrl = json['photoUrl'];
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
    if (this.homeBookings != null) {
      data['home_bookings'] =
          this.homeBookings!.map((v) => v.toJson()).toList();
    }
    data['isFavorite'] = this.isFavorite;
    data['photoUrl'] = this.photoUrl;
    return data;
  }
}

class HomeBookings {
  int? id;
  String? bookingStatus;
  String? start;
  String? end;
  int? total;
  int? homeId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  HomeBookings(
      {this.id,
        this.bookingStatus,
        this.start,
        this.end,
        this.total,
        this.homeId,
        this.userId,
        this.createdAt,
        this.updatedAt});

  HomeBookings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingStatus = json['booking_status'];
    start = json['start'];
    end = json['end'];
    total = json['total'];
    homeId = json['home_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    return data;
  }
}