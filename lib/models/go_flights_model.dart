class GoFlightsModel {
  List<Data>? data;
  int? count;
  int? status;

  GoFlightsModel({this.data, this.count, this.status});

  GoFlightsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    count = json['count'];
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
  Office? office;
  List<dynamic>? classes;  // Replace 'dynamic' with the appropriate type
  List<dynamic>? services; // Replace 'dynamic' with the appropriate type
  List<dynamic>? stops;    // Replace 'dynamic' with the appropriate type
  FromCity? fromCity;
  FromCity? toCity;

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
        this.office,
        this.classes,
        this.services,
        this.stops,
        this.fromCity,
        this.toCity});

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
    office =
    json['office'] != null ? Office.fromJson(json['office']) : null;
    classes = json['classes'] != null ? List<dynamic>.from(json['classes']) : null;
    services = json['services'] != null ? List<dynamic>.from(json['services']) : null;
    stops = json['stops'] != null ? List<dynamic>.from(json['stops']) : null;
    fromCity = json['from_city'] != null
        ? FromCity.fromJson(json['from_city'])
        : null;
    toCity =
    json['to_city'] != null ? FromCity.fromJson(json['to_city']) : null;
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
