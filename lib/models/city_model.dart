// class CityModel {
//   List<City>? city;
//
//   CityModel({this.city});
//
//   CityModel.fromJson(Map<String, dynamic> json) {
//     if (json['city'] != null) {
//       city = <City>[];
//       json['city'].forEach((v) {
//         city!.add(City.fromJson(v));
//       });
//     }
//   }
// }
//
// class City {
//   int? id;
//   String? name;
//   int? population;
//   double? latitude;
//   double? longitude;
//   String? createdAt;
//   String? updatedAt;
//
//   City(
//       {this.id,
//         this.name,
//         this.population,
//         this.latitude,
//         this.longitude,
//         this.createdAt,
//         this.updatedAt});
//
//   City.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     population = json['population'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
// }

class CityModel {
  List<City>? city;
  int? status;

  CityModel({this.city, this.status});

  CityModel.fromJson(Map<String, dynamic> json) {
    if (json['city'] != null) {
      city = <City>[];
      json['city'].forEach((v) {
        city!.add(City.fromJson(v));
      });
    }
    status = json['status'];
  }
}

class City {
  int? id;
  String? name;
  String? population;
  double? latitude;
  double? longitude;
  String? createdAt;
  String? updatedAt;

  City(
      {this.id,
        this.name,
        this.population,
        this.latitude,
        this.longitude,
        this.createdAt,
        this.updatedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    population = json['population'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}