class SearchModel {
  bool? status;
  List<Stocks>? stocks;

  SearchModel({this.status, this.stocks});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['stocks'] != null) {
      stocks = <Stocks>[];
      json['stocks'].forEach((v) {
        stocks!.add(new Stocks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.stocks != null) {
      data['stocks'] = this.stocks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stocks {
  int? id;
  int? userId;
  int? categoryId;
  String? slugs;
  String? name;
  String? website;
  String? sellingPrice;
  String? buyingPrice;
  String? lotSize;
  String? lotSizeLimit;
  String? couponRate;
  String? buyOffline;
  String? approximateMargin;
  String? maturity;
  String? photo;
  String? visible;
  String? about;
  String? userType;
  num? adminId;
  num? adminPrice;
  String? adminPriceType;
  int? featured;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? photoUrl;

  Stocks(
      {this.id,
        this.userId,
        this.categoryId,
        this.slugs,
        this.name,
        this.website,
        this.sellingPrice,
        this.buyingPrice,
        this.lotSize,
        this.lotSizeLimit,
        this.couponRate,
        this.buyOffline,
        this.approximateMargin,
        this.maturity,
        this.photo,
        this.visible,
        this.about,
        this.userType,
        this.adminId,
        this.adminPrice,
        this.adminPriceType,
        this.featured,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.photoUrl});

  Stocks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    slugs = json['slugs'];
    name = json['name'];
    website = json['website'];
    sellingPrice = json['selling_price'];
    buyingPrice = json['buying_price'];
    lotSize = json['lot_size'];
    lotSizeLimit = json['lot_size_limit'];
    couponRate = json['coupon_rate'];
    buyOffline = json['buy_offline'];
    approximateMargin = json['approximate_margin'];
    maturity = json['maturity'];
    photo = json['photo'];
    visible = json['visible'];
    about = json['about'];
    userType = json['user_type'];
    adminId = json['admin_id'];
    adminPrice = json['admin_price'];
    adminPriceType = json['admin_price_type'];
    featured = json['featured'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    photoUrl = json['photo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['slugs'] = this.slugs;
    data['name'] = this.name;
    data['website'] = this.website;
    data['selling_price'] = this.sellingPrice;
    data['buying_price'] = this.buyingPrice;
    data['lot_size'] = this.lotSize;
    data['lot_size_limit'] = this.lotSizeLimit;
    data['coupon_rate'] = this.couponRate;
    data['buy_offline'] = this.buyOffline;
    data['approximate_margin'] = this.approximateMargin;
    data['maturity'] = this.maturity;
    data['photo'] = this.photo;
    data['visible'] = this.visible;
    data['about'] = this.about;
    data['user_type'] = this.userType;
    data['admin_id'] = this.adminId;
    data['admin_price'] = this.adminPrice;
    data['admin_price_type'] = this.adminPriceType;
    data['featured'] = this.featured;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['photo_url'] = this.photoUrl;
    return data;
  }
}