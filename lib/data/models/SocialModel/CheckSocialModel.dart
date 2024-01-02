class CheckSocialModel {
  bool? status;
  String? message;
  Data? data;

  CheckSocialModel({this.status, this.message, this.data});

  CheckSocialModel.fromJson(Map<String, dynamic> json) {
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

  Data({this.userData, this.newUser});

  Data.fromJson(Map<String, dynamic> json) {
    userData = json['user_data'] != null
        ? new UserData.fromJson(json['user_data'])
        : null;
    newUser = json['new_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userData != null) {
      data['user_data'] = this.userData!.toJson();
    }
    data['new_user'] = this.newUser;
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
  dynamic customerId;
  String? photo;
  dynamic about;
  String? referalCode;
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
  dynamic reviewMessage;
  bool? isMembership;
  int? isMembershipExist;
  String? merchantuserid;
  String? rewardPoint;
  String? statusHtml;
  int? age;
  int? professionid;
  String? roleName;
  String? professionName;
  String? photoUrl;
  List<dynamic>? idProof;
  List<dynamic>? userMetaData;
  List<dynamic>? userProfession;
  String? nameMasked;
  String? emailMasked;
  String? mobileMasked;
  String? ratings;
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
        this.masked,
        this.premiumType,
        this.reviewMessage,
        this.isMembership,
        this.isMembershipExist,
        this.merchantuserid,
        this.rewardPoint,
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
        this.ratings,
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
    masked = json['masked'];
    premiumType = json['premium_type'];
    reviewMessage = json['review_message'];
    isMembership = json['is_membership'];
    isMembershipExist = json['is_membership_exist'];
    merchantuserid = json['merchantuserid'];
    rewardPoint = json['reward_point'];
    statusHtml = json['status_html'];
    age = json['age'];
    professionid = json['professionid'];
    roleName = json['role_name'];
    professionName = json['profession_name'];
    photoUrl = json['photo_url'];

    nameMasked = json['name_masked'];
    emailMasked = json['email_masked'];
    mobileMasked = json['mobile_masked'];
    ratings = json['ratings'];
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
    data['masked'] = this.masked;
    data['premium_type'] = this.premiumType;
    data['review_message'] = this.reviewMessage;
    data['is_membership'] = this.isMembership;
    data['is_membership_exist'] = this.isMembershipExist;
    data['merchantuserid'] = this.merchantuserid;
    data['reward_point'] = this.rewardPoint;
    data['status_html'] = this.statusHtml;
    data['age'] = this.age;
    data['professionid'] = this.professionid;
    data['role_name'] = this.roleName;
    data['profession_name'] = this.professionName;
    data['photo_url'] = this.photoUrl;
    data['name_masked'] = this.nameMasked;
    data['email_masked'] = this.emailMasked;
    data['mobile_masked'] = this.mobileMasked;
    data['ratings'] = this.ratings;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    return data;
  }
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
