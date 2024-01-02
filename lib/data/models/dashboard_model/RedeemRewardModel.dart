class RedeemRewardModel {
  bool? status;
  Data? data;

  RedeemRewardModel({this.status, this.data});

  RedeemRewardModel.fromJson(Map<String, dynamic> json) {
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
  List<RedeemRewards>? redeemRewards;

  Data({this.redeemRewards});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['redeem_rewards'] != null) {
      redeemRewards = <RedeemRewards>[];
      json['redeem_rewards'].forEach((v) {
        redeemRewards!.add(new RedeemRewards.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.redeemRewards != null) {
      data['redeem_rewards'] =
          this.redeemRewards!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RedeemRewards {
  int? id;
  String? title;
  String? description;
  String? thumbnail;
  String? file;
  int? price;
  int? points;
  String? referenceLink;
  String? downloadLink;
  String? type;
  String? userId;
  String? userType;
  int? status;
  String? createdAt;
  String? updatedAt;
  bool? redeemStatus;
  String? thumbnailUrl;
  String? fileUrl;
  String? shortTitle;
  String? fileType;

  RedeemRewards(
      {this.id,
        this.title,
        this.description,
        this.thumbnail,
        this.file,
        this.price,
        this.points,
        this.referenceLink,
        this.downloadLink,
        this.type,
        this.userId,
        this.userType,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.redeemStatus,
        this.thumbnailUrl,
        this.fileUrl,
        this.shortTitle,
        this.fileType});

  RedeemRewards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    file = json['file'];
    price = json['price'];
    points = json['points'];
    referenceLink = json['reference_link'];
    downloadLink = json['download_link'];
    type = json['type'];
    userId = json['user_id'];
    userType = json['user_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    redeemStatus = json['redeem_status'];
    thumbnailUrl = json['thumbnail_url'];
    fileUrl = json['file_url'];
    shortTitle = json['short_title'];
    fileType = json['file_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['file'] = this.file;
    data['price'] = this.price;
    data['points'] = this.points;
    data['reference_link'] = this.referenceLink;
    data['download_link'] = this.downloadLink;
    data['type'] = this.type;
    data['user_id'] = this.userId;
    data['user_type'] = this.userType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['redeem_status'] = this.redeemStatus;
    data['thumbnail_url'] = this.thumbnailUrl;
    data['file_url'] = this.fileUrl;
    data['short_title'] = this.shortTitle;
    data['file_type'] = this.fileType;
    return data;
  }
}
