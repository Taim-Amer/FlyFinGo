class ProfileModel {
  Data? data;
  int? status;

  ProfileModel({this.data, this.status});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String? phone;
  Null? emailVerifiedAt;
  Null? resetCode;
  Null? verificationCode;
  Null? verificationCodeExpiresAt;
  int? verifiedAccount;
  int? money;
  Null? googleId;
  String? role;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.emailVerifiedAt,
        this.resetCode,
        this.verificationCode,
        this.verificationCodeExpiresAt,
        this.verifiedAccount,
        this.money,
        this.googleId,
        this.role,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    resetCode = json['reset_code'];
    verificationCode = json['verification_code'];
    verificationCodeExpiresAt = json['verification_code_expires_at'];
    verifiedAccount = json['verified_account'];
    money = json['money'];
    googleId = json['google_id'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['reset_code'] = this.resetCode;
    data['verification_code'] = this.verificationCode;
    data['verification_code_expires_at'] = this.verificationCodeExpiresAt;
    data['verified_account'] = this.verifiedAccount;
    data['money'] = this.money;
    data['google_id'] = this.googleId;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}