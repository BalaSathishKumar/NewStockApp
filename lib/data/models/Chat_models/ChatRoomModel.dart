class GetMessagesModel {
  bool? status;
  List<Messages>? messages;

  GetMessagesModel({this.status, this.messages});

  GetMessagesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['messages'] != null) {
      messages = <Messages>[];
      json['messages'].forEach((v) {
        messages!.add(new Messages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Messages {
  int? id;
  int? crId;
  int? userId;
  String? message;
  String? image;
  String? messageType;
  String? userType;
  int? status;
  String? createdAt;
  String? updatedAt;
  bool? user;
  String? fileUrl;
  bool? admin;
  Room? room;

  Messages(
      {this.id,
        this.crId,
        this.userId,
        this.message,
        this.image,
        this.messageType,
        this.userType,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.fileUrl,
        this.admin,
        this.room});

  Messages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    crId = json['cr_id'];
    userId = json['user_id'];
    message = json['message'];
    image = json['image'];
    messageType = json['message_type'];
    userType = json['user_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'];
    fileUrl = json['file_url'];
    admin = json['admin'];
    room = json['room'] != null ? new Room.fromJson(json['room']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cr_id'] = this.crId;
    data['user_id'] = this.userId;
    data['message'] = this.message;
    data['image'] = this.image;
    data['message_type'] = this.messageType;
    data['user_type'] = this.userType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user'] = this.user;
    data['file_url'] = this.fileUrl;
    data['admin'] = this.admin;
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    return data;
  }
}

class Room {
  int? id;
  int? userOneId;
  int? userTwoId;
  int? adminId;
  int? status;
  String? createdAt;
  String? updatedAt;
  Userone? userone;
  Usertwo? usertwo;
  bool? admin;

  Room(
      {this.id,
        this.userOneId,
        this.userTwoId,
        this.adminId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.userone,
        this.usertwo,
        this.admin});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userOneId = json['user_one_id'];
    userTwoId = json['user_two_id'];
    adminId = json['admin_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userone =
    json['userone'] != null ? new Userone.fromJson(json['userone']) : null;
    usertwo =
    json['usertwo'] != null ? new Usertwo.fromJson(json['usertwo']) : null;
    admin = json['admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_one_id'] = this.userOneId;
    data['user_two_id'] = this.userTwoId;
    data['admin_id'] = this.adminId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.userone != null) {
      data['userone'] = this.userone!.toJson();
    }
    if (this.usertwo != null) {
      data['usertwo'] = this.usertwo!.toJson();
    }
    data['admin'] = this.admin;
    return data;
  }
}

class Userone {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? city;
  String? state;
  int? professionId;
  Null? customerId;
  String? photo;
  String? about;
  String? referalCode;
  Null? emailVerifiedAt;
  Null? mobileVerifiedAt;
  String? authToken;
  String? fcmTokan;
  String? facebookId;
  String? googleId;
  int? roleId;
  int? featured;
  int? status;
  String? active;
  String? createdAt;
  String? updatedAt;
  String? roleName;
  String? professionName;
  String? photoUrl;
  List<IdProof>? idProof;

  Userone(
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
        this.createdAt,
        this.updatedAt,
        this.roleName,
        this.professionName,
        this.photoUrl,
        this.idProof});

  Userone.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleName = json['role_name'];
    professionName = json['profession_name'];
    photoUrl = json['photo_url'];
    if (json['id_proof'] != null) {
      idProof = <IdProof>[];
      json['id_proof'].forEach((v) {
        idProof!.add(new IdProof.fromJson(v));
      });
    }
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['role_name'] = this.roleName;
    data['profession_name'] = this.professionName;
    data['photo_url'] = this.photoUrl;
    if (this.idProof != null) {
      data['id_proof'] = this.idProof!.map((v) => v.toJson()).toList();
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

  IdProof(
      {this.id,
        this.userId,
        this.proofName,
        this.path,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.proofUrl});

  IdProof.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    proofName = json['proof_name'];
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
    data['path'] = this.path;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['proof_url'] = this.proofUrl;
    return data;
  }
}

class Usertwo {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? city;
  String? state;
  int? professionId;
  String? customerId;
  Null? photo;
  Null? about;
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
  String? createdAt;
  String? updatedAt;
  String? roleName;
  String? professionName;
  String? photoUrl;
  List<IdProof>? idProof;

  Usertwo(
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
        this.createdAt,
        this.updatedAt,
        this.roleName,
        this.professionName,
        this.photoUrl,
        this.idProof});

  Usertwo.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleName = json['role_name'];
    professionName = json['profession_name'];
    photoUrl = json['photo_url'];
    if (json['id_proof'] != null) {
      idProof = <IdProof>[];
      json['id_proof'].forEach((v) {
        idProof!.add(new IdProof.fromJson(v));
      });
    }
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
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['role_name'] = this.roleName;
    data['profession_name'] = this.professionName;
    data['photo_url'] = this.photoUrl;
    if (this.idProof != null) {
      data['id_proof'] = this.idProof!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
