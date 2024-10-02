class FlightRoundModel {
  final int id;
  final String dateGo;
  final String takeoffGo;
  final String landingGo;
  final String durationGo;
  final String dateBack;
  final String takeoffBack;
  final String landingBack;
  final String durationBack;
  final int capacity;
  final int officeId;
  final int fromCityId;
  final int toCityId;
  final Office office;
  final List<FlightClass> classes;
  final List<Service> services;
  final List<dynamic> stops;
  final City fromCity;
  final City toCity;

  FlightRoundModel({
    required this.id,
    required this.dateGo,
    required this.takeoffGo,
    required this.landingGo,
    required this.durationGo,
    required this.dateBack,
    required this.takeoffBack,
    required this.landingBack,
    required this.durationBack,
    required this.capacity,
    required this.officeId,
    required this.fromCityId,
    required this.toCityId,
    required this.office,
    required this.classes,
    required this.services,
    required this.stops,
    required this.fromCity,
    required this.toCity,
  });

  factory FlightRoundModel.fromJson(Map<String, dynamic> json) {
    return FlightRoundModel(
      id: json['id'],
      dateGo: json['dateGo'],
      takeoffGo: json['takeoffGo'],
      landingGo: json['landingGo'],
      durationGo: json['durationGo'],
      dateBack: json['dateBack'],
      takeoffBack: json['takeoffBack'],
      landingBack: json['landingBack'],
      durationBack: json['durationBack'],
      capacity: json['capacity'],
      officeId: json['office_id'],
      fromCityId: json['from_city_id'],
      toCityId: json['to_city_id'],
      office: Office.fromJson(json['office']),
      classes: (json['classes'] as List).map((i) => FlightClass.fromJson(i)).toList(),
      services: (json['services'] as List).map((i) => Service.fromJson(i)).toList(),
      stops: json['stops'] as List<dynamic>,  // This is correct if stops can be any type of data.
      fromCity: City.fromJson(json['from_city']),
      toCity: City.fromJson(json['to_city']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateGo': dateGo,
      'takeoffGo': takeoffGo,
      'landingGo': landingGo,
      'durationGo': durationGo,
      'dateBack': dateBack,
      'takeoffBack': takeoffBack,
      'landingBack': landingBack,
      'durationBack': durationBack,
      'capacity': capacity,
      'office_id': officeId,
      'from_city_id': fromCityId,
      'to_city_id': toCityId,
      'office': office.toJson(),
      'classes': classes.map((i) => i.toJson()).toList(),
      'services': services.map((i) => i.toJson()).toList(),
      'stops': stops,  // Keep stops as a dynamic list.
      'from_city': fromCity.toJson(),
      'to_city': toCity.toJson(),
    };
  }
}

class Office {
  final int id;
  final String name;
  final int cityId;
  final String createdAt;
  final String updatedAt;

  Office({
    required this.id,
    required this.name,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      id: json['id'],
      name: json['name'],
      cityId: json['city_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'city_id': cityId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class FlightClass {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final FlightClassPivot pivot;

  FlightClass({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory FlightClass.fromJson(Map<String, dynamic> json) {
    return FlightClass(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pivot: FlightClassPivot.fromJson(json['pivot']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'pivot': pivot.toJson(),
    };
  }
}

class FlightClassPivot {
  final int flightRoundId;
  final int classId;
  final int price;
  final int capacity;

  FlightClassPivot({
    required this.flightRoundId,
    required this.classId,
    required this.price,
    required this.capacity,
  });

  factory FlightClassPivot.fromJson(Map<String, dynamic> json) {
    return FlightClassPivot(
      flightRoundId: json['flightRound_id'],
      classId: json['class_id'],
      price: json['price'],
      capacity: json['capacity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flightRound_id': flightRoundId,
      'class_id': classId,
      'price': price,
      'capacity': capacity,
    };
  }
}

class Service {
  final int id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final ServicePivot pivot;

  Service({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      pivot: ServicePivot.fromJson(json['pivot']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'pivot': pivot.toJson(),
    };
  }
}

class ServicePivot {
  final int flightRoundId;
  final int serviceId;

  ServicePivot({
    required this.flightRoundId,
    required this.serviceId,
  });

  factory ServicePivot.fromJson(Map<String, dynamic> json) {
    return ServicePivot(
      flightRoundId: json['flightRound_id'],
      serviceId: json['service_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flightRound_id': flightRoundId,
      'service_id': serviceId,
    };
  }
}

class City {
  final int id;
  final String name;
  final String population;
  final double latitude;
  final double longitude;
  final String createdAt;
  final String updatedAt;

  City({
    required this.id,
    required this.name,
    required this.population,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      name: json['name'],
      population: json['population'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'population': population,
      'latitude': latitude,
      'longitude': longitude,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}
