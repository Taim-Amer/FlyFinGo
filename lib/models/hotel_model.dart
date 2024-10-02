class HotelsModel {
  List<Data>? data;
  int? status;

  HotelsModel({this.data, this.status});

  HotelsModel.fromJson(Map<String, dynamic> json) {
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
  List<Rooms>? rooms;
  bool? isFavorite;
  String? photoUrl;

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
        this.rooms,
        this.isFavorite,
        this.photoUrl});

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
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
    isFavorite = json['isFavorite'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone_hotel'] = this.phoneHotel;
    data['rate'] = this.rate;
    data['price'] = this.price;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['city_id'] = this.cityId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    data['isFavorite'] = this.isFavorite;
    data['photoUrl'] = this.photoUrl;
    return data;
  }
}

class Rooms {
  int? id;
  int? personNum;
  int? number;
  int? hotelId;
  int? isBooking;
  String? createdAt;
  String? updatedAt;
  List<Bookings>? bookings;

  Rooms(
      {this.id,
        this.personNum,
        this.number,
        this.hotelId,
        this.isBooking,
        this.createdAt,
        this.updatedAt,
        this.bookings});

  Rooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personNum = json['person_num'];
    number = json['number'];
    hotelId = json['hotel_id'];
    isBooking = json['isBooking'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(new Bookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['person_num'] = this.personNum;
    data['number'] = this.number;
    data['hotel_id'] = this.hotelId;
    data['isBooking'] = this.isBooking;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.bookings != null) {
      data['bookings'] = this.bookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bookings {
  int? id;
  String? start;
  String? end;
  int? persons;
  int? total;
  int? taken;
  int? idRoom;
  int? idHotel;
  int? idUser;
  String? createdAt;
  String? updatedAt;

  Bookings(
      {this.id,
        this.start,
        this.end,
        this.persons,
        this.total,
        this.taken,
        this.idRoom,
        this.idHotel,
        this.idUser,
        this.createdAt,
        this.updatedAt});

  Bookings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    start = json['start'];
    end = json['end'];
    persons = json['persons'];
    total = json['total'];
    taken = json['taken'];
    idRoom = json['id_room'];
    idHotel = json['id_hotel'];
    idUser = json['id_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start'] = this.start;
    data['end'] = this.end;
    data['persons'] = this.persons;
    data['total'] = this.total;
    data['taken'] = this.taken;
    data['id_room'] = this.idRoom;
    data['id_hotel'] = this.idHotel;
    data['id_user'] = this.idUser;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}