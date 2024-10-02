class HotelDetailsModel {
  List<Data>? data;
  int? status;

  HotelDetailsModel({this.data, this.status});

  HotelDetailsModel.fromJson(Map<String, dynamic> json) {
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
  List<Service>? service;
  List<Comment>? comment;
  List<Photo>? photo;
  String? message;

  Data({this.service, this.comment, this.photo, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['service'] != null) {
      service = <Service>[];
      json['service'].forEach((v) {
        service!.add(Service.fromJson(v));
      });
    }
    if (json['comment'] != null) {
      comment = <Comment>[];
      json['comment'].forEach((v) {
        comment!.add(Comment.fromJson(v));
      });
    }
    if (json['photo'] != null) {
      photo = <Photo>[];
      json['photo'].forEach((v) {
        photo!.add(Photo.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class Service {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Service({this.id, this.name, this.createdAt, this.updatedAt, this.pivot});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
}

class Pivot {
  int? idHotel;
  int? idService;

  Pivot({this.idHotel, this.idService});

  Pivot.fromJson(Map<String, dynamic> json) {
    idHotel = json['id_hotel'];
    idService = json['id_service'];
  }
}

class Comment {
  int? id;
  String? comment;
  int? rate;
  int? userId;
  int? hotelId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Comment(
      {this.id,
        this.comment,
        this.rate,
        this.userId,
        this.hotelId,
        this.createdAt,
        this.updatedAt,
        this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    rate = json['rate'];
    userId = json['user_id'];
    hotelId = json['hotel_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class User {
  int? id;
  String? name;
  List<Bookings>? bookings;

  User({this.id, this.name, this.bookings});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['bookings'] != null) {
      bookings = <Bookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(Bookings.fromJson(v));
      });
    }
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
}

class Photo {
  int? id;
  String? img;
  int? hotelId;
  String? createdAt;
  String? updatedAt;

  Photo({this.id, this.img, this.hotelId, this.createdAt, this.updatedAt});

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    hotelId = json['hotel_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}