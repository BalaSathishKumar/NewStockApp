class ChatUsersList {
  bool? status;
  Data? data;

  ChatUsersList({this.status, this.data});

  ChatUsersList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Users>? users;
  List<Users>? dealers;
  List<Users>? advisors;

  Data({this.users, this.dealers, this.advisors});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
    if (json['dealers'] != null) {
      dealers = <Users>[];
      json['dealers'].forEach((v) {
        dealers!.add(new Users.fromJson(v));
      });
    }
    if (json['advisors'] != null) {
      advisors = <Users>[];
      json['advisors'].forEach((v) {
        advisors!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    if (this.dealers != null) {
      data['dealers'] = this.dealers!.map((v) => v.toJson()).toList();
    }
    if (this.advisors != null) {
      data['advisors'] = this.advisors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
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
  dynamic? emailVerifiedAt;
  dynamic? mobileVerifiedAt;
  String? authToken;
  String? fcmTokan;
  String? facebookId;
  String? googleId;
  int? roleId;
  int? featured;
  int? status;
  String? active;
  int? masked;
  String? premiumType;
  String? createdAt;
  String? updatedAt;
  bool? blocked;
  String? statusHtml;
  int? age;
  int? professionid;
  String? roleName;
  String? professionName;
  String? photoUrl;
  List<IdProof>? idProof;
  List<UserMetaData>? userMetaData;
  List<UserProfession>? userProfession;
  String? nameMasked;
  String? emailMasked;
  String? mobileMasked;
  bool? chatEnable;
  String? ratings;

  Users(
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
        this.emailVerifiedAt,
        this.mobileVerifiedAt,
        this.authToken,
        this.fcmTokan,
        this.facebookId,
        this.googleId,
        this.roleId,
        this.featured,
        this.status,
        this.active,
        this.masked,
        this.premiumType,
        this.createdAt,
        this.updatedAt,
        this.blocked,
        this.statusHtml,
        this.age,
        this.professionid,
        this.roleName,
        this.professionName,
        this.photoUrl,
        this.idProof,
        this.userMetaData,
        this.userProfession,
        this.nameMasked,
        this.emailMasked,
        this.mobileMasked,
        this.chatEnable,
        this.ratings});

  Users.fromJson(Map<String, dynamic> json) {
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
    emailVerifiedAt = json['email_verified_at'];
    mobileVerifiedAt = json['mobile_verified_at'];
    authToken = json['auth_token'];
    fcmTokan = json['fcm_tokan'];
    facebookId = json['facebook_id'];
    googleId = json['google_id'];
    roleId = json['role_id'];
    featured = json['featured'];
    status = json['status'];
    active = json['active'];
    masked = json['masked'];
    premiumType = json['premium_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    blocked = json['blocked'];
    statusHtml = json['status_html'];
    age = json['age'];
    professionid = json['professionid'];
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
    nameMasked = json['name_masked'];
    emailMasked = json['email_masked'];
    mobileMasked = json['mobile_masked'];
    chatEnable = json['chat_enable'];
    ratings = json['ratings'];
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
    data['email_verified_at'] = this.emailVerifiedAt;
    data['mobile_verified_at'] = this.mobileVerifiedAt;
    data['auth_token'] = this.authToken;
    data['fcm_tokan'] = this.fcmTokan;
    data['facebook_id'] = this.facebookId;
    data['google_id'] = this.googleId;
    data['role_id'] = this.roleId;
    data['featured'] = this.featured;
    data['status'] = this.status;
    data['active'] = this.active;
    data['masked'] = this.masked;
    data['premium_type'] = this.premiumType;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['blocked'] = this.blocked;
    data['status_html'] = this.statusHtml;
    data['age'] = this.age;
    data['professionid'] = this.professionid;
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
    data['name_masked'] = this.nameMasked;
    data['email_masked'] = this.emailMasked;
    data['mobile_masked'] = this.mobileMasked;
    data['chat_enable'] = this.chatEnable;
    data['ratings'] = this.ratings;
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

  IdProof(
      {this.id,
        this.userId,
        this.proofName,
        this.name,
        this.path,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.proofUrl});

  IdProof.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    proofName = json['proof_name'];
    name = json['name'];
    path = json['path'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    proofUrl = json['proof_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['proof_name'] = this.proofName;
    data['name'] = this.name;
    data['path'] = this.path;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['proof_url'] = this.proofUrl;
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

class UserProfession {
  int? id;
  int? userId;
  int? professionId;
  int? status;
  String? createdAt;
  String? updatedAt;
  Profession? profession;

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
        ? new Profession.fromJson(json['profession'])
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

class Profession {
  int? id;
  String? name;
  int? status;
  String? createdAt;
  String? updatedAt;

  Profession({this.id, this.name, this.status, this.createdAt, this.updatedAt});

  Profession.fromJson(Map<String, dynamic> json) {
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
