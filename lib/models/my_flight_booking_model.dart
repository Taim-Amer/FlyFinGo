class MyFlightBookingModel {
  List<Data>? data;
  int? status;

  MyFlightBookingModel({this.data, this.status});

  MyFlightBookingModel.fromJson(Map<String, dynamic> json) {
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
  String? date;
  String? takeoff;
  String? landing;
  String? duration;
  int? capacity;
  int? numStops;
  int? officeId;
  int? fromCityId;
  int? toCityId;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;
  Office? office;
  FromCity? fromCity;
  FromCity? toCity;
  List<Stops>? stops;

  Data(
      {this.id,
        this.date,
        this.takeoff,
        this.landing,
        this.duration,
        this.capacity,
        this.numStops,
        this.officeId,
        this.fromCityId,
        this.toCityId,
        this.createdAt,
        this.updatedAt,
        this.pivot,
        this.office,
        this.fromCity,
        this.toCity,
        this.stops});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    takeoff = json['takeoff'];
    landing = json['landing'];
    duration = json['duration'];
    capacity = json['capacity'];
    numStops = json['NumStops'];
    officeId = json['office_id'];
    fromCityId = json['from_city_id'];
    toCityId = json['to_city_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
    office =
    json['office'] != null ? Office.fromJson(json['office']) : null;
    fromCity = json['from_city'] != null
        ? FromCity.fromJson(json['from_city'])
        : null;
    toCity =
    json['to_city'] != null ? FromCity.fromJson(json['to_city']) : null;
    if (json['stops'] != null) {
      stops = <Stops>[];
      json['stops'].forEach((v) {
        stops!.add(Stops.fromJson(v));
      });
    }
  }
}

class Pivot {
  int? userId;
  int? flightGoId;
  int? passenger;

  Pivot({this.userId, this.flightGoId, this.passenger});

  Pivot.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    flightGoId = json['flightGo_id'];
    passenger = json['passenger'];
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

class FromCity {
  int? id;
  String? name;
  String? population;
  double? latitude;
  double? longitude;
  String? createdAt;
  String? updatedAt;

  FromCity(
      {this.id,
        this.name,
        this.population,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt});

  FromCity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    population = json['population'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class Stops {
  int? id;
  String? name;
  Null? createdAt;
  Null? updatedAt;
  Pivot? pivot;

  Stops({this.id, this.name, this.createdAt, this.updatedAt, this.pivot});

  Stops.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }
}
