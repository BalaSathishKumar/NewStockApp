import '../LocationsModel/ProfessionModel.dart';

class ProfileResponseModel {
  bool? status;
  User? user;
  List<Howitwork>? howitwork;

  ProfileResponseModel({this.status, this.user});

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['howitwork'] != null) {
      howitwork = <Howitwork>[];
      json['howitwork'].forEach((v) {
        howitwork!.add(new Howitwork.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.howitwork != null) {
      data['howitwork'] = this.howitwork!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? city;
  String? state;
  int? professionId;
  String? customerId;
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
  String? reviewMessage;
  bool? isMemberShip;
  String? roleName;
  String? professionName;
  String? photoUrl;
  List<IdProof>? idProof;
  List<UserMetaData>? userMetaData;
  List<UserProfession>? userProfession;
  Role? role;


  User(
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
        this.reviewMessage,
        this.isMemberShip,
        this.roleName,
        this.professionName,
        this.photoUrl,
        this.idProof,
        this.userMetaData,
        this.userProfession,
        this.role,});

  User.fromJson(Map<String, dynamic> json) {
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
    reviewMessage = json['review_message'];
    isMemberShip = json['is_membership'];
    roleName = json['role_name'];
    professionName = json['profession_name'];
    photoUrl = json['photo_url'];
    if (json['id_proof'] != null) {
      idProof = <IdProof>[];
      json['id_proof'].forEach((v) {
        idProof!.add(new IdProof.fromJson(v));
      });
    }
    if (json['user_meta_data'] != null) {
      userMetaData = <UserMetaData>[];
      json['user_meta_data'].forEach((v) {
        userMetaData!.add(new UserMetaData.fromJson(v));
      });
    }
    if (json['user_profession'] != null) {
      userProfession = <UserProfession>[];
      json['user_profession'].forEach((v) {
        userProfession!.add(new UserProfession.fromJson(v));
      });
    }
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
    data['review_message'] = this.reviewMessage;
    data['is_membership'] = this.isMemberShip;
    data['role_name'] = this.roleName;
    data['profession_name'] = this.professionName;
    data['photo_url'] = this.photoUrl;
    if (this.idProof != null) {
      data['id_proof'] = this.idProof!.map((v) => v.toJson()).toList();
    }
    if (this.userMetaData != null) {
      data['user_meta_data'] =
          this.userMetaData!.map((v) => v.toJson()).toList();
    }
    if (this.userProfession != null) {
      data['user_profession'] =
          this.userProfession!.map((v) => v.toJson()).toList();
    }
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }

    return data;
  }
}

class UserProfession {
  int? id;
  int? userId;
  int? professionId;
  int? status;
  String? createdAt;
  String? updatedAt;
  Professions? profession;

  UserProfession(
      {this.id,
        this.userId,
        this.professionId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.profession});

  UserProfession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    professionId = json['profession_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profession = json['profession'] != null
        ? new Professions.fromJson(json['profession'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['profession_id'] = this.professionId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.profession != null) {
      data['profession'] = this.profession!.toJson();
    }
    return data;
  }
}

class ProfessionsPR {
  int? id;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;

  ProfessionsPR({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  ProfessionsPR.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class UserMetaData {
  int? id;
  int? userId;
  String? key;
  String? value;
  int? status;
  String? createdAt;
  String? updatedAt;

  UserMetaData(
      {this.id,
        this.userId,
        this.key,
        this.value,
        this.status,
        this.createdAt,
        this.updatedAt});

  UserMetaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    key = json['key'];
    value = json['value'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['key'] = this.key;
    data['value'] = this.value;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class IdProof {
  int? id;
  int? userId;
  String? proofName;
  String? name;
  String? path;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? proofUrl;

  IdProof({
    required this.id,
    required this.userId,
    required this.proofName,
    required this.name,
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
    name: json["name"],
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
    "name": name,
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

class Howitwork {
  int? id;
  String? title;
  String? description;
  String? userApp;
  String? page;
  int? status;
  String? createdAt;
  String? updatedAt;

  Howitwork(
      {this.id,
        this.title,
        this.description,
        this.userApp,
        this.page,
        this.status,
        this.createdAt,
        this.updatedAt});

  Howitwork.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    userApp = json['user_app'];
    page = json['page'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['user_app'] = this.userApp;
    data['page'] = this.page;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}