class MyFlightRoundBookedModel {
  List<Data>? data;
  int? status;

  MyFlightRoundBookedModel({this.data, this.status});

  MyFlightRoundBookedModel.fromJson(Map<String, dynamic> json) {
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
  String? dateGo;
  String? takeoffGo;
  String? landingGo;
  String? durationGo;
  String? dateBack;
  String? takeoffBack;
  String? landingBack;
  String? durationBack;
  int? capacity;
  int? officeId;
  int? fromCityId;
  int? toCityId;
  Pivot? pivot;
  ToCity? toCity;
  ToCity? fromCity;
  Office? office;

  Data(
      {this.id,
        this.dateGo,
        this.takeoffGo,
        this.landingGo,
        this.durationGo,
        this.dateBack,
        this.takeoffBack,
        this.landingBack,
        this.durationBack,
        this.capacity,
        this.officeId,
        this.fromCityId,
        this.toCityId,
        this.pivot,
        this.toCity,
        this.fromCity,
        this.office});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateGo = json['dateGo'];
    takeoffGo = json['takeoffGo'];
    landingGo = json['landingGo'];
    durationGo = json['durationGo'];
    dateBack = json['dateBack'];
    takeoffBack = json['takeoffBack'];
    landingBack = json['landingBack'];
    durationBack = json['durationBack'];
    capacity = json['capacity'];
    officeId = json['office_id'];
    fromCityId = json['from_city_id'];
    toCityId = json['to_city_id'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
    toCity =
    json['to_city'] != null ? ToCity.fromJson(json['to_city']) : null;
    fromCity = json['from_city'] != null
        ? ToCity.fromJson(json['from_city'])
        : null;
    office =
    json['office'] != null ? Office.fromJson(json['office']) : null;
  }
}

class Pivot {
  int? userId;
  int? flightRoundId;
  int? passenger;

  Pivot({this.userId, this.flightRoundId, this.passenger});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    flightRoundId = json['flightRound_id'];
    passenger = json['passenger'];
  }
}

class ToCity {
  int? id;
  String? name;
  String? population;
  double? latitude;
  double? longitude;
  String? createdAt;
  String? updatedAt;

  ToCity(
      {this.id,
        this.name,
        this.population,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt});

  ToCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    population = json['population'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Office {
  int? id;
  String? name;
  int? cityId;
  String? createdAt;
  String? updatedAt;

  Office({this.id, this.name, this.cityId, this.createdAt, this.updatedAt});

  Office.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    cityId = json['city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}