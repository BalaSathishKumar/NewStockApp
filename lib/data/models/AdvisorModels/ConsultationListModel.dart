import '../Explore_model/ExploreModel.dart';

class ConsultationListModel {
  bool? status;
  List<Consultations>? consultations;

  ConsultationListModel({this.status, this.consultations});

  ConsultationListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['consultations'] != null) {
      consultations = <Consultations>[];
      json['consultations'].forEach((v) {
        consultations!.add(new Consultations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.consultations != null) {
      data['consultations'] =
          this.consultations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Consultations {
  int? id;
  int? userId;
  int? advisorId;
  String? notes;
  String? cancelNotes;
  int? status;
  String? createdAt;
  String? updatedAt;
  Advisor? advisor;
  User? user;
  String? statusTxt;
  ConsultCategory? category;
  Stocks? stock;

  Consultations(
      {this.id,
        this.userId,
        this.advisorId,
        this.notes,
        this.cancelNotes,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.advisor,
        this.user,
        this.statusTxt,
        this.category,
      this.stock});

  Consultations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    advisorId = json['advisor_id'];
    notes = json['notes'];
    cancelNotes = json['cancel_notes'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    advisor =
    json['advisor'] != null ? new Advisor.fromJson(json['advisor']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    statusTxt = json['status_txt'];
    category = json['category'] != null ? new ConsultCategory.fromJson(json['category']) : null;
    stock = json['stock'] != null ? new Stocks.fromJson(json['stock']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['advisor_id'] = this.advisorId;
    data['notes'] = this.notes;
    data['cancel_notes'] = this.cancelNotes;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.advisor != null) {
      data['advisor'] = this.advisor!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['status_txt'] = this.statusTxt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.stock != null) {
      data['stock'] = this.stock!.toJson();
    }
    return data;
  }
}

class ConsultCategory {
  int? id;
  String? categoryName;
  int? status;
  String? createdAt;
  String? updatedAt;

  ConsultCategory(
      {this.id,
        this.categoryName,
        this.status,
        this.createdAt,
        this.updatedAt});

  ConsultCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Advisor {
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
  String? emailVerifiedAt;
  String? mobileVerifiedAt;
  String? authToken;
  String? fcmTokan;
  String? facebookId;
  String? googleId;
  int? roleId;
  int? featured;
  int? status;
  String? active;
  int? masked;
  String? createdAt;
  String? updatedAt;
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

  Advisor(
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
        this.createdAt,
        this.updatedAt,
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
        this.mobileMasked});

  Advisor.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
  String? emailVerifiedAt;
  String? mobileVerifiedAt;
  String? authToken;
  String? fcmTokan;
  String? facebookId;
  String? googleId;
  int? roleId;
  int? featured;
  int? status;
  String? active;
  int? masked;
  String? createdAt;
  String? updatedAt;
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
        this.createdAt,
        this.updatedAt,
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
        this.mobileMasked});

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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
    return data;
  }
}
