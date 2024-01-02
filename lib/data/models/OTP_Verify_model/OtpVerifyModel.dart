// To parse this JSON data, do
//
//     final otpResponseModel = otpResponseModelFromJson(jsonString);

import 'dart:convert';

OtpResponseModel otpResponseModelFromJson(String str) => OtpResponseModel.fromJson(json.decode(str));

String otpResponseModelToJson(OtpResponseModel data) => json.encode(data.toJson());

class OtpResponseModel {
  bool status;
  String? message;
  Data data;

  OtpResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OtpResponseModel.fromJson(Map<String?, dynamic> json) => OtpResponseModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String?, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  UserData userData;
  String? newUser;
  String? mobile;

  Data({
    required this.userData,
    required this.newUser,
    required this.mobile,
  });

  factory Data.fromJson(Map<String?, dynamic> json) => Data(
    userData: UserData.fromJson(json["user_data"]),
    newUser: json["new_user"],
    mobile: json["mobile"],
  );

  Map<String?, dynamic> toJson() => {
    "user_data": userData.toJson(),
    "new_user": newUser,
    "mobile": mobile,
  };
}

class UserData {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? city;
  String? state;
  int? professionId;
  dynamic customerId;
  String? photo;
  String? about;
  String? referalCode;
  String? authToken;
  String? fcmTokan;
  String? facebookId;
  String? googleId;
  int? roleId;
  int? featured;
  int? status;
  String? active;
  String? roleName;
  String? professionName;
  String? photoUrl;
  List<IdProof> idProof;
  Role role;

  UserData({
    required this.id,
    required this.name,
    required this.mobile,
    required this.email,
    required this.city,
    required this.state,
    required this.professionId,
    this.customerId,
    required this.photo,
    required this.about,
    required this.referalCode,
    required this.authToken,
    required this.fcmTokan,
    required this.facebookId,
    required this.googleId,
    required this.roleId,
    required this.featured,
    required this.status,
    required this.active,
    required this.roleName,
    required this.professionName,
    required this.photoUrl,
    required this.idProof,
    required this.role,
  });

  factory UserData.fromJson(Map<String?, dynamic> json) => UserData(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    email: json["email"],
    city: json["city"],
    state: json["state"],
    professionId: json["profession_id"],
    customerId: json["customer_id"],
    photo: json["photo"],
    about: json["about"],
    referalCode: json["referal_code"],
    authToken: json["auth_token"],
    fcmTokan: json["fcm_tokan"],
    facebookId: json["facebook_id"],
    googleId: json["google_id"],
    roleId: json["role_id"],
    featured: json["featured"],
    status: json["status"],
    active: json["active"],
    roleName: json["role_name"],
    professionName: json["profession_name"],
    photoUrl: json["photo_url"],
    idProof: List<IdProof>.from(json["id_proof"].map((x) => IdProof.fromJson(x))),
    role: Role.fromJson(json["role"]),
  );

  Map<String?, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "email": email,
    "city": city,
    "state": state,
    "profession_id": professionId,
    "customer_id": customerId,
    "photo": photo,
    "about": about,
    "referal_code": referalCode,
    "auth_token": authToken,
    "fcm_tokan": fcmTokan,
    "facebook_id": facebookId,
    "google_id": googleId,
    "role_id": roleId,
    "featured": featured,
    "status": status,
    "active": active,
    "role_name": roleName,
    "profession_name": professionName,
    "photo_url": photoUrl,
    "id_proof": List<dynamic>.from(idProof.map((x) => x.toJson())),
    "role": role.toJson(),
  };
}

class IdProof {
  int? id;
  int? userId;
  String? proofName;
  String? path;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? proofUrl;

  IdProof({
    required this.id,
    required this.userId,
    required this.proofName,
    required this.path,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.proofUrl,
  });

  factory IdProof.fromJson(Map<String?, dynamic> json) => IdProof(
    id: json["id"],
    userId: json["user_id"],
    proofName: json["proof_name"],
    path: json["path"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    proofUrl: json["proof_url"],
  );

  Map<String?, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "proof_name": proofName,
    "path": path,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "proof_url": proofUrl,
  };
}

class Role {
  int? id;
  String? roleName;
  int? status;

  Role({
    required this.id,
    required this.roleName,
    required this.status,
  });

  factory Role.fromJson(Map<String?, dynamic> json) => Role(
    id: json["id"],
    roleName: json["role_name"],
    status: json["status"],
  );

  Map<String?, dynamic> toJson() => {
    "id": id,
    "role_name": roleName,
    "status": status,
  };
}
