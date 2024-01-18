import 'package:base_flutter_provider_project/data/models/Explore_model/ExploreModel.dart';

class AdvisorReviewListModel {
  bool? status;
  List<Data>? data;

  AdvisorReviewListModel({this.status, this.data});

  AdvisorReviewListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? stockId;
  num? ratings;
  String? text;
  int? userId;
  String? userName;
  String? userType;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? statusText;
  User? user;
  Stocks? stock;

  Data(
      {this.id,
        this.stockId,
        this.ratings,
        this.text,
        this.userId,
        this.userName,
        this.userType,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.statusText,
        this.user,
        this.stock});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stockId = json['stock_id'];
    ratings = json['ratings'];
    text = json['text'];
    userId = json['user_id'];
    userName = json['user_name'];
    userType = json['user_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    statusText = json['status_text'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    stock = json['stock'] != null ? new Stocks.fromJson(json['stock']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stock_id'] = this.stockId;
    data['ratings'] = this.ratings;
    data['text'] = this.text;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_type'] = this.userType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['status_text'] = this.statusText;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.stock != null) {
      data['stock'] = this.stock!.toJson();
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
  dynamic customerId;
  String? photo;
  String? about;
  String? referalCode;
  dynamic emailVerifiedAt;
  dynamic mobileVerifiedAt;
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
  String? ratings;

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
        this.premiumType,
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
        this.mobileMasked,
        this.ratings});

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
    premiumType = json['premium_type'];
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



class DealerDetails {
  int? id;
  String? name;
  String? email;
  String? mobile;
  String? photoUrl;

  DealerDetails({this.id, this.name, this.email, this.mobile, this.photoUrl});

  DealerDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    photoUrl = json['photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['photo_url'] = this.photoUrl;
    return data;
  }
}

class ListData {
  int? id;
  int? stockId;
  String? key;
  String? value;
  int? status;
  String? createdAt;
  String? updatedAt;

  ListData(
      {this.id,
        this.stockId,
        this.key,
        this.value,
        this.status,
        this.createdAt,
        this.updatedAt});

  ListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stockId = json['stock_id'];
    key = json['key'];
    value = json['value'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stock_id'] = this.stockId;
    data['key'] = this.key;
    data['value'] = this.value;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
