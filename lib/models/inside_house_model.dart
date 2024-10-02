class InsideHouseModel {
  Data? data;
  int? status;

  InsideHouseModel({this.data, this.status});

  InsideHouseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  Features? features;
  List<Photo>? photos;
  HomeOwnerData? homeOwnerData;

  Data({this.features, this.photos, this.homeOwnerData});

  Data.fromJson(Map<String, dynamic> json) {
    features = json['features'] != null
        ? Features.fromJson(json['features'])
        : null;
    if (json['photos'] != null) {
      photos = <Photo>[];
      json['photos'].forEach((v) {
        photos!.add(Photo.fromJson(v));
      });
    }
    homeOwnerData = json['homeOwnerData'] != null
        ? HomeOwnerData.fromJson(json['homeOwnerData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.features != null) {
      data['features'] = this.features!.toJson();
    }
    if (this.photos != null) {
      data['photos'] = this.photos!.map((v) => v.toJson()).toList();
    }
    if (this.homeOwnerData != null) {
      data['homeOwnerData'] = this.homeOwnerData!.toJson();
    }
    return data;
  }
}

class Features {
  String? message;

  Features({this.message});

  Features.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = this.message;
    return data;
  }
}

class HomeOwnerData {
  String? ownerName;
  String? ownerNumber;

  HomeOwnerData({this.ownerName, this.ownerNumber});

  HomeOwnerData.fromJson(Map<String, dynamic> json) {
    ownerName = json['ownerName'];
    ownerNumber = json['ownerNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['ownerName'] = this.ownerName;
    data['ownerNumber'] = this.ownerNumber;
    return data;
  }
}

class Photo {
  String? url;
  String? description;

  Photo({this.url, this.description});

  Photo.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['url'] = this.url;
    data['description'] = this.description;
    return data;
  }
}
