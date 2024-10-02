class CitySearchModel {
  List<Search>? search;
  int? status;

  CitySearchModel({this.search, this.status});

  CitySearchModel.fromJson(Map<String, dynamic> json) {
    if (json['search'] != null) {
      search = <Search>[];
      json['search'].forEach((v) {
        search!.add(Search.fromJson(v));
      });
    } else {
      search = [];
    }
    status = json['status'];
  }
}

class Search {
  int? id;
  String? name;
  String? population;
  double? latitude;
  double? longitude;
  String? createdAt;
  String? updatedAt;

  Search({
    this.id,
    this.name,
    this.population,
    this.latitude,
    this.longitude,
    this.createdAt,
    this.updatedAt,
  });

  Search.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    population = json['population'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
