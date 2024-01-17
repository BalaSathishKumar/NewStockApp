class SubscriptionDetailModel {
  bool? status;
  Subscriptions? subscriptions;
  List<History>? history;

  SubscriptionDetailModel({this.status, this.subscriptions, this.history});

  SubscriptionDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    subscriptions = json['subscriptions'] != null
        ? new Subscriptions.fromJson(json['subscriptions'])
        : null;
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(new History.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.subscriptions != null) {
      data['subscriptions'] = this.subscriptions!.toJson();
    }
    if (this.history != null) {
      data['history'] = this.history!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class History {
  History({
    num? id,
    num? userId,
    num? transactionId,
    dynamic subscriptionId,
    String? startAt,
    String? expireAt,
    num? status,
    String? createdAt,
    String? updatedAt,
    bool? isActive,
    String? invoiceUrl,
    Transactions? transactions,}){
    _id = id;
    _userId = userId;
    _transactionId = transactionId;
    _subscriptionId = subscriptionId;
    _startAt = startAt;
    _expireAt = expireAt;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _isActive = isActive;
    _invoiceUrl = invoiceUrl;
    _transactions = transactions;
  }

  History.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _transactionId = json['transaction_id'];
    _subscriptionId = json['subscription_id'];
    _startAt = json['start_at'];
    _expireAt = json['expire_at'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _isActive = json['is_active'];
    _invoiceUrl = json['invoice_url'];
    _transactions = json['transactions'] != null ? Transactions.fromJson(json['transactions']) : null;
  }
  num? _id;
  num? _userId;
  num? _transactionId;
  dynamic _subscriptionId;
  String? _startAt;
  String? _expireAt;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  bool? _isActive;
  String? _invoiceUrl;
  Transactions? _transactions;
  History copyWith({  num? id,
    num? userId,
    num? transactionId,
    dynamic subscriptionId,
    String? startAt,
    String? expireAt,
    num? status,
    String? createdAt,
    String? updatedAt,
    bool? isActive,
    String? invoiceUrl,
    Transactions? transactions,
  }) => History(  id: id ?? _id,
    userId: userId ?? _userId,
    transactionId: transactionId ?? _transactionId,
    subscriptionId: subscriptionId ?? _subscriptionId,
    startAt: startAt ?? _startAt,
    expireAt: expireAt ?? _expireAt,
    status: status ?? _status,
    createdAt: createdAt ?? _createdAt,
    updatedAt: updatedAt ?? _updatedAt,
    isActive: isActive ?? _isActive,
    invoiceUrl: invoiceUrl ?? _invoiceUrl,
    transactions: transactions ?? _transactions,
  );
  num? get id => _id;
  num? get userId => _userId;
  num? get transactionId => _transactionId;
  dynamic get subscriptionId => _subscriptionId;
  String? get startAt => _startAt;
  String? get expireAt => _expireAt;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  bool? get isActive => _isActive;
  String? get invoiceUrl => _invoiceUrl;
  Transactions? get transactions => _transactions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['transaction_id'] = _transactionId;
    map['subscription_id'] = _subscriptionId;
    map['start_at'] = _startAt;
    map['expire_at'] = _expireAt;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['is_active'] = _isActive;
    map['invoice_url'] = _invoiceUrl;
    if (_transactions != null) {
      map['transactions'] = _transactions?.toJson();
    }
    return map;
  }

}

class Subscriptions {
  int? id;
  int? userId;
  int? planId;
  String? durationType;
  int? duration;
  int? activeSubscriptionId;
  String? startAt;
  String? expireAt;
  int? status;
  String? createdAt;
  String? updatedAt;
  bool? isActive;
  SubscriptionData? subscriptionData;
  User? user;

  Subscriptions(
      {this.id,
        this.userId,
        this.planId,
        this.durationType,
        this.duration,
        this.activeSubscriptionId,
        this.startAt,
        this.expireAt,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.isActive,
        this.subscriptionData,
        this.user});

  Subscriptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    planId = json['plan_id'];
    durationType = json['duration_type'];
    duration = json['duration'];
    activeSubscriptionId = json['active_subscription_id'];
    startAt = json['start_at'];
    expireAt = json['expire_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    subscriptionData = json['subscription_data'] != null
        ? new SubscriptionData.fromJson(json['subscription_data'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['plan_id'] = this.planId;
    data['duration_type'] = this.durationType;
    data['duration'] = this.duration;
    data['active_subscription_id'] = this.activeSubscriptionId;
    data['start_at'] = this.startAt;
    data['expire_at'] = this.expireAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_active'] = this.isActive;
    if (this.subscriptionData != null) {
      data['subscription_data'] = this.subscriptionData!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class SubscriptionData {
  int? id;
  int? userId;
  int? transactionId;
  String? subscriptionId;
  String? startAt;
  String? expireAt;
  int? status;
  String? createdAt;
  String? updatedAt;
  bool? isActive;
  String? invoiceUrl;
  Transactions? transactions;

  SubscriptionData(
      {this.id,
        this.userId,
        this.transactionId,
        this.subscriptionId,
        this.startAt,
        this.expireAt,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.isActive,
        this.invoiceUrl,
        this.transactions});

  SubscriptionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    transactionId = json['transaction_id'];
    subscriptionId = json['subscription_id'];
    startAt = json['start_at'];
    expireAt = json['expire_at'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isActive = json['is_active'];
    invoiceUrl = json['invoice_url'];
    transactions = json['transactions'] != null
        ? new Transactions.fromJson(json['transactions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['transaction_id'] = this.transactionId;
    data['subscription_id'] = this.subscriptionId;
    data['start_at'] = this.startAt;
    data['expire_at'] = this.expireAt;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_active'] = this.isActive;
    data['invoice_url'] = this.invoiceUrl;
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.toJson();
    }
    return data;
  }
}

class Transactions {
  int? id;
  int? userId;
  int? packageId;
  num? amount;
  num? total;
  int? duration;
  String? durationType;
  String? transactionsId;
  String? subscriptionId;
  String? merchantSubscriptionId;
  String? merchantUserId;
  dynamic? authWorkflowType;
  int? recurringCount;
  dynamic? amountType;
  String? authRequestId;
  String? code;
  String? transactionId;
  int? status;
  String? createdAt;
  String? updatedAt;
  User? user;
  Package? package;
  String? statusTxt;
  String? amountText;

  Transactions(
      {this.id,
        this.userId,
        this.packageId,
        this.amount,
        this.total,
        this.duration,
        this.durationType,
        this.transactionsId,
        this.subscriptionId,
        this.merchantSubscriptionId,
        this.merchantUserId,
        this.authWorkflowType,
        this.recurringCount,
        this.amountType,
        this.authRequestId,
        this.code,
        this.transactionId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.user,
        this.package,
        this.statusTxt,
        this.amountText});

  Transactions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    packageId = json['package_id'];
    amount = json['amount'];
    total = json['total'];
    duration = json['duration'];
    durationType = json['duration_type'];
    transactionsId = json['transactions_id'];
    subscriptionId = json['subscription_id'];
    merchantSubscriptionId = json['merchantSubscriptionId'];
    merchantUserId = json['merchantUserId'];
    authWorkflowType = json['authWorkflowType'];
    recurringCount = json['recurringCount'];
    amountType = json['amountType'];
    authRequestId = json['authRequestId'];
    code = json['code'];
    transactionId = json['transactionId'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    package =
    json['package'] != null ? new Package.fromJson(json['package']) : null;
    statusTxt = json['status_txt'];
    amountText = json['amount_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['package_id'] = this.packageId;
    data['amount'] = this.amount;
    data['total'] = this.total;
    data['duration'] = this.duration;
    data['duration_type'] = this.durationType;
    data['transactions_id'] = this.transactionsId;
    data['subscription_id'] = this.subscriptionId;
    data['merchantSubscriptionId'] = this.merchantSubscriptionId;
    data['merchantUserId'] = this.merchantUserId;
    data['authWorkflowType'] = this.authWorkflowType;
    data['recurringCount'] = this.recurringCount;
    data['amountType'] = this.amountType;
    data['authRequestId'] = this.authRequestId;
    data['code'] = this.code;
    data['transactionId'] = this.transactionId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.package != null) {
      data['package'] = this.package!.toJson();
    }
    data['status_txt'] = this.statusTxt;
    data['amount_text'] = this.amountText;
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
  String? reviewMessage;
  bool? isMembership;
  int? isMembershipExist;
  String? merchantuserid;
  dynamic? rewardPoint;
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

class Package {
  int? id;
  String? title;
  String? description;
  int? amount;
  String? durationType;
  int? duration;
  int? interval;
  dynamic? planId;
  int? roleId;
  int? stockCount;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? roleName;
  String? subscriptionType;
  int? subscriptionInterval;
  String? subscriptionDays;

  Package(
      {this.id,
        this.title,
        this.description,
        this.amount,
        this.durationType,
        this.duration,
        this.interval,
        this.planId,
        this.roleId,
        this.stockCount,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.roleName,
        this.subscriptionType,
        this.subscriptionInterval,
        this.subscriptionDays});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    amount = json['amount'];
    durationType = json['duration_type'];
    duration = json['duration'];
    interval = json['interval'];
    planId = json['plan_id'];
    roleId = json['role_id'];
    stockCount = json['stock_count'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    roleName = json['role_name'];
    subscriptionType = json['subscription_type'];
    subscriptionInterval = json['subscription_interval'];
    subscriptionDays = json['subscription_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['duration_type'] = this.durationType;
    data['duration'] = this.duration;
    data['interval'] = this.interval;
    data['plan_id'] = this.planId;
    data['role_id'] = this.roleId;
    data['stock_count'] = this.stockCount;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['role_name'] = this.roleName;
    data['subscription_type'] = this.subscriptionType;
    data['subscription_interval'] = this.subscriptionInterval;
    data['subscription_days'] = this.subscriptionDays;
    return data;
  }
}
