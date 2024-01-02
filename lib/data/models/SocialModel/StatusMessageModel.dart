class StatusMessageModel {
  bool? status;
  String? message;
  Data? data;

  StatusMessageModel({this.status, this.message, this.data});

  StatusMessageModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  UserData? userData;
  String? newUser;
  String? mobile;

  Data({this.userData, this.newUser, this.mobile});

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    newUser = json['new_user'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    data['new_user'] = this.newUser;
    data['mobile'] = this.mobile;
    return data;
  }
}

class UserData {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? city;
  String? state;
  int? professionId;
  dynamic? customerId;
  String? photo;
  dynamic? about;
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
  List<IdProof>? idProof;
  Role? role;

  UserData(
      {this.id,
        this.name,
        this.mobile,
        this.email,
        this.city,
        this.state,
        this.professionId,
        this.customerId,
        this.photo,
        this.about,
        this.referalCode,
        this.authToken,
        this.fcmTokan,
        this.facebookId,
        this.googleId,
        this.roleId,
        this.featured,
        this.status,
        this.active,
        this.roleName,
        this.professionName,
        this.photoUrl,
        this.idProof,
        this.role});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    city = json['city'];
    state = json['state'];
    professionId = json['profession_id'];
    customerId = json['customer_id'];
    photo = json['photo'];
    about = json['about'];
    referalCode = json['referal_code'];
    authToken = json['auth_token'];
    fcmTokan = json['fcm_tokan'];
    facebookId = json['facebook_id'];
    googleId = json['google_id'];
    roleId = json['role_id'];
    featured = json['featured'];
    status = json['status'];
    active = json['active'];
    roleName = json['role_name'];
    professionName = json['profession_name'];
    photoUrl = json['photo_url'];
    idProof: json['idProof'] != null ? new IdProof.fromJson(json['idProof']) : null;
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['city'] = this.city;
    data['state'] = this.state;
    data['profession_id'] = this.professionId;
    data['customer_id'] = this.customerId;
    data['photo'] = this.photo;
    data['about'] = this.about;
    data['referal_code'] = this.referalCode;
    data['auth_token'] = this.authToken;
    data['fcm_tokan'] = this.fcmTokan;
    data['facebook_id'] = this.facebookId;
    data['google_id'] = this.googleId;
    data['role_id'] = this.roleId;
    data['featured'] = this.featured;
    data['status'] = this.status;
    data['active'] = this.active;
    data['role_name'] = this.roleName;
    data['profession_name'] = this.professionName;
    data['photo_url'] = this.photoUrl;
    if (this.idProof != null) {
      data['id_proof'] = this.idProof!.map((v) => v.toJson()).toList();
    }
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    return data;
  }
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

  Role({this.id, this.roleName, this.status});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roleName = json['role_name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role_name'] = this.roleName;
    data['status'] = this.status;
    return data;
  }
}
