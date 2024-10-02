class MyBookingsModel {
  Data? data;

  MyBookingsModel({this.data});

  MyBookingsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<Hotels>? hotels;

  Data({this.hotels});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['hotels'] != null) {
      hotels = <Hotels>[];
      json['hotels'].forEach((v) {
        hotels!.add(Hotels.fromJson(v));
      });
    }
  }
}

class Hotels {
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
  Room? room;
  Hotel? hotel;

  Hotels(
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
        this.updatedAt,
        this.room,
        this.hotel});

  Hotels.fromJson(Map<String, dynamic> json) {
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
    room = json['room'] != null ? Room.fromJson(json['room']) : null;
    hotel = json['hotel'] != null ? Hotel.fromJson(json['hotel']) : null;
  }
}

class Room {
  int? id;
  int? personNum;

  Room({this.id, this.personNum});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    personNum = json['person_num'];
  }
}

class Hotel {
  int? id;
  String? name;
  int? price;

  Hotel({this.id, this.name, this.price});

  Hotel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }
}