class NewHouseModel {
  String? message;
  Home? home;

  NewHouseModel({this.message, this.home});

  NewHouseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = this.message;
    if (this.home != null) {
      data['home'] = this.home!.toJson();
    }
    return data;
  }
}

class Home {
  int? space;
  String? location;
  String? description;
  int? monthlyRent;
  int? personNum;
  int? rooms;
  int? baths;
  int? userOwnerId;
  int? cityId;
  String? updatedAt;
  String? createdAt;
  int? id;

  Home(
      {this.space,
        this.location,
        this.description,
        this.monthlyRent,
        this.personNum,
        this.rooms,
        this.baths,
        this.userOwnerId,
        this.cityId,
        this.updatedAt,
        this.createdAt,
        this.id});

  Home.fromJson(Map<String, dynamic> json) {
    space = json['space'];
    location = json['location'];
    description = json['description'];
    monthlyRent = json['monthly_rent'];
    personNum = json['person_num'];
    rooms = json['rooms'];
    baths = json['baths'];
    userOwnerId = json['user_owner_id'];
    cityId = json['city_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['space'] = this.space;
    data['location'] = this.location;
    data['description'] = this.description;
    data['monthly_rent'] = this.monthlyRent;
    data['person_num'] = this.personNum;
    data['rooms'] = this.rooms;
    data['baths'] = this.baths;
    data['user_owner_id'] = this.userOwnerId;
    data['city_id'] = this.cityId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}