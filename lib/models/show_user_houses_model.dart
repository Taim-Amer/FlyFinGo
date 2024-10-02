class ShowUserHousesModel {
  List<VerifiedHomes>? verifiedHomes;
  List<UnverifiedHomes>? unverifiedHomes;

  ShowUserHousesModel({this.verifiedHomes, this.unverifiedHomes});

  ShowUserHousesModel.fromJson(Map<String, dynamic> json) {
    if (json['verified_homes'] != null) {
      verifiedHomes = <VerifiedHomes>[];
      json['verified_homes'].forEach((v) {
        verifiedHomes!.add(VerifiedHomes.fromJson(v));
      });
    }
    if (json['unverified_homes'] != null) {
      unverifiedHomes = <UnverifiedHomes>[];
      json['unverified_homes'].forEach((v) {
        unverifiedHomes!.add(UnverifiedHomes.fromJson(v));
      });
    }
  }
}

class VerifiedHomes {
  int? id;
  int? space;
  String? location;
  String? description;
  int? monthlyRent;
  int? personNum;
  int? rooms;
  int? baths;
  int? userOwnerId;
  int? cityId;
  String? verificationStatus;
  String? createdAt;
  String? updatedAt;
  int? homeBookingsCount;

  VerifiedHomes(
      {this.id,
        this.space,
        this.location,
        this.description,
        this.monthlyRent,
        this.personNum,
        this.rooms,
        this.baths,
        this.userOwnerId,
        this.cityId,
        this.verificationStatus,
        this.createdAt,
        this.updatedAt,
        this.homeBookingsCount});

  VerifiedHomes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    space = json['space'];
    location = json['location'];
    description = json['description'];
    monthlyRent = json['monthly_rent'];
    personNum = json['person_num'];
    rooms = json['rooms'];
    baths = json['baths'];
    userOwnerId = json['user_owner_id'];
    cityId = json['city_id'];
    verificationStatus = json['Verification_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    homeBookingsCount = json['home_bookings_count'];
  }
}

class UnverifiedHomes {
  int? id;
  int? space;
  String? location;
  String? description;
  int? monthlyRent;
  int? personNum;
  int? rooms;
  int? baths;
  int? userOwnerId;
  int? cityId;
  String? verificationStatus;
  String? createdAt;
  String? updatedAt;
  int? homeBookingsCount;

  UnverifiedHomes(
      {this.id,
        this.space,
        this.location,
        this.description,
        this.monthlyRent,
        this.personNum,
        this.rooms,
        this.baths,
        this.userOwnerId,
        this.cityId,
        this.verificationStatus,
        this.createdAt,
        this.updatedAt,
        this.homeBookingsCount});

  UnverifiedHomes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    space = json['space'];
    location = json['location'];
    description = json['description'];
    monthlyRent = json['monthly_rent'];
    personNum = json['person_num'];
    rooms = json['rooms'];
    baths = json['baths'];
    userOwnerId = json['user_owner_id'];
    cityId = json['city_id'];
    verificationStatus = json['Verification_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    homeBookingsCount = json['home_bookings_count'];
  }
}
