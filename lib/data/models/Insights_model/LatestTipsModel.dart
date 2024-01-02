class LatestTipsModel {
  bool? status;
  List<Insights>? insights;

  LatestTipsModel({this.status, this.insights});

  LatestTipsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['insights'] != null) {
      insights = <Insights>[];
      json['insights'].forEach((v) {
        insights!.add(new Insights.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.insights != null) {
      data['insights'] = this.insights!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Insights {
  int? id;
  String? title;
  int? categoryId;
  int? stockId;
  String? description;
  String? image;
  String? video;
  String? userApp;
  String? type;
  int? status;
  String? createdAt;
  String? updatedAt;
  Stock? stock;
  TipCategory? category;
  String? imageUrl;

  Insights(
      {this.id,
        this.title,
        this.categoryId,
        this.stockId,
        this.description,
        this.image,
        this.video,
        this.userApp,
        this.type,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.stock,
        this.category,
        this.imageUrl});

  Insights.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    categoryId = json['category_id'];
    stockId = json['stock_id'];
    description = json['description'];
    image = json['image'];
    video = json['video'];
    userApp = json['user_app'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stock = json['stock'] != null ? new Stock.fromJson(json['stock']) : null;
    category = json['category'] != null
        ? new TipCategory.fromJson(json['category'])
        : null;
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['category_id'] = this.categoryId;
    data['stock_id'] = this.stockId;
    data['description'] = this.description;
    data['image'] = this.image;
    data['video'] = this.video;
    data['user_app'] = this.userApp;
    data['type'] = this.type;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.stock != null) {
      data['stock'] = this.stock!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class Stock {
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
  int? adminId;
  int? adminPrice;
  String? adminPriceType;
  int? featured;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? photoUrl;
  TipCategory? category;
  List<dynamic>? priceRange;
  List<dynamic>? financialInformation;
  List<dynamic>? importantInformation;
  List<dynamic>? news;
  List<dynamic>? reviews;
  List<dynamic>? returns;
  List<dynamic>? tentativeValue;

  Stock(
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
        this.photoUrl,
        this.category,
        this.priceRange,
        this.financialInformation,
        this.importantInformation,
        this.news,
        this.reviews,
        this.returns,
        this.tentativeValue});

  Stock.fromJson(Map<String, dynamic> json) {
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
    category = json['category'] != null
        ? new TipCategory.fromJson(json['category'])
        : null;
    if (json['price_range'] != null) {
      json['price_range'] ?? [];
  /*    priceRange = <Null>[];
      json['price_range'].forEach((v) {
        priceRange!.add(new Null.fromJson(v));
      });*/
    }
    if (json['financial_information'] != null) {
      json['financial_information'] ?? [];
  /*    financialInformation = <Null>[];
      json['financial_information'].forEach((v) {
        financialInformation!.add(new Null.fromJson(v));
      });*/
    }
    if (json['important_information'] != null) {
      json['important_information'] ?? [];
   /*   importantInformation = <Null>[];
      json['important_information'].forEach((v) {
        importantInformation!.add(new Null.fromJson(v));
      });*/
    }
    if (json['news'] != null) {
      json['news'] ?? [];
  /*    news = <Null>[];
      json['news'].forEach((v) {
        news!.add(new Null.fromJson(v));
      });*/
    }
    if (json['reviews'] != null) {
      json['reviews'] ?? [];
   /*   reviews = <Null>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Null.fromJson(v));
      });*/
    }
    if (json['returns'] != null) {
      json['returns'] ?? [];
   /*   returns = <Null>[];
      json['returns'].forEach((v) {
        returns!.add(new Null.fromJson(v));
      });*/
    }
    if (json['tentative_value'] != null) {
      json['tentative_value'] ?? [];
  /*    tentativeValue = <Null>[];
      json['tentative_value'].forEach((v) {
        tentativeValue!.add(new Null.fromJson(v));
      });*/
    }
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
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.priceRange != null) {
      data['price_range'] = this.priceRange!.map((v) => v.toJson()).toList();
    }
    if (this.financialInformation != null) {
      data['financial_information'] =
          this.financialInformation!.map((v) => v.toJson()).toList();
    }
    if (this.importantInformation != null) {
      data['important_information'] =
          this.importantInformation!.map((v) => v.toJson()).toList();
    }
    if (this.news != null) {
      data['news'] = this.news!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.returns != null) {
      data['returns'] = this.returns!.map((v) => v.toJson()).toList();
    }
    if (this.tentativeValue != null) {
      data['tentative_value'] =
          this.tentativeValue!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TipCategory {
  int? id;
  String? categoryName;
  int? status;
  String? createdAt;
  String? updatedAt;

  TipCategory(
      {this.id,
        this.categoryName,
        this.status,
        this.createdAt,
        this.updatedAt});

  TipCategory.fromJson(Map<String, dynamic> json) {
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
