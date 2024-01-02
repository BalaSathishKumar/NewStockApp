class SubscriptionModel {
  bool? status;
  String? message;
  Plan? plan;
  Subscription? subscription;

  SubscriptionModel({this.status,this.message ,this.plan, this.subscription});

  SubscriptionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
    subscription = json['subscription'] != null ? new Subscription.fromJson(json['subscription']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.plan != null) {
      data['plan'] = this.plan!.toJson();
    }
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.toJson();
    }
    return data;
  }
}

class Plan {
  int? id;
  String? title;
  String? description;
  int? amount;
  String? durationType;
  int? duration;
  int? interval;
  Null? planId;
  int? roleId;
  int? stockCount;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? roleName;
  String? subscriptionType;
  int? subscriptionInterval;

  Plan(
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
        this.subscriptionInterval});

  Plan.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Subscription {
  String? mobileNum;
  String? callbackUrl;
  int? amount;
  String? merchantUserId;
  String? merchantTransactionId;
  String? merchantId;


  Subscription(
      {this.mobileNum,
        this.callbackUrl,
        this.amount,
        this.merchantUserId,
        this.merchantTransactionId,
        this.merchantId,
      });

  Subscription.fromJson(Map<String, dynamic> json) {
    mobileNum = json['mobileNumber'];
    callbackUrl = json['callbackUrl'];
    amount = json['amount'];
    merchantUserId = json['merchantUserId'];
    merchantTransactionId = json['merchantTransactionId'];
    merchantId = json['merchantId'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobileNumber'] = this.mobileNum;
    data['callback_url'] = this.callbackUrl;
    data['amount'] = this.amount;
    data['merchantUserId'] = this.merchantUserId;
    data['merchantTransactionId'] = this.merchantTransactionId;
    data['merchantId'] = this.merchantId;
    return data;
  }
}
