class ShowUserHouseBookingModel {
  Home? home;
  List<Booking>? bookings;
  int? status;

  ShowUserHouseBookingModel({this.home, this.bookings, this.status});

  ShowUserHouseBookingModel.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
    if (json['bookings'] != null) {
      bookings = <Booking>[];
      json['bookings'].forEach((v) {
        bookings!.add(Booking.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (home != null) {
      data['home'] = home!.toJson();
    }
    if (bookings != null) {
      data['bookings'] = bookings!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Home {
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

  Home(
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
        this.updatedAt});

  Home.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['space'] = space;
    data['location'] = location;
    data['description'] = description;
    data['monthly_rent'] = monthlyRent;
    data['person_num'] = personNum;
    data['rooms'] = rooms;
    data['baths'] = baths;
    data['user_owner_id'] = userOwnerId;
    data['city_id'] = cityId;
    data['Verification_status'] = verificationStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Booking {
  int? id;
  int? homeId;
  String? bookingDate;
  String? bookingStatus;

  Booking({this.id, this.homeId, this.bookingDate, this.bookingStatus});

  Booking.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    homeId = json['home_id'];
    bookingDate = json['booking_date'];
    bookingStatus = json['booking_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['home_id'] = homeId;
    data['booking_date'] = bookingDate;
    data['booking_status'] = bookingStatus;
    return data;
  }
}
