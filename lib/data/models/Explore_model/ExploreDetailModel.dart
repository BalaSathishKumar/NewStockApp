import '../Chat_models/ChatRoom2Model.dart';
import '../Insights_model/CatBasedBlogsModel.dart';

class ExploreDetailModel {
  bool? status;
  Stockss? stocks;

  ExploreDetailModel({this.status, this.stocks});

  ExploreDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    stocks =
    json['stocks'] != null ? new Stockss.fromJson(json['stocks']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.stocks != null) {
      data['stocks'] = this.stocks!.toJson();
    }
    return data;
  }
}

class Stockss {
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
  num? adminPrice;
  String? adminPriceType;
  int? featured;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? photoUrl;
  String? userRating;
  String? saudaRating;
  String? saudaRatingText;
  String? financialTitle;
  bool? wishList;
  List<Blogs>? saudaInsights;
  List<AdvisorReviews>? advisorReviews;
  List<AdvisorReviews>? ratings;
  Categoryyy? category;
  List<PriceRange>? priceRange;
  List<FinancialInformation>? financialInformation;
  List<dynamic>? importantInformation;
  List<dynamic>? news;
  List<dynamic>? reviews;
  List<dynamic>? returns;
  List<TentativeValue>? tentativeValue;
  List<MetaDataa>? metaData;
  List<MetaDataa>? ratingList;


  Stockss(
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
        this.wishList,
        this.saudaInsights,
        this.advisorReviews,
        this.ratings,
        this.photoUrl,
        this.userRating,
        this.saudaRating,
        this.saudaRatingText,
        this.financialTitle,
        this.category,
        this.priceRange,
        this.financialInformation,
        this.importantInformation,
        this.news,
        this.reviews,
        this.returns,
        this.tentativeValue,
        this.metaData,
        this.ratingList,});

  Stockss.fromJson(Map<String, dynamic> json) {
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
    wishList = json['wishlist'];
    if (json['rating_list'] != null) {
      ratingList = <MetaDataa>[];
      json['rating_list'].forEach((v) {
        ratingList!.add(new MetaDataa.fromJson(v));
      });
    }
    if (json['sauda_insights'] != null) {
      saudaInsights = <Blogs>[];
      json['sauda_insights'].forEach((v) {
        saudaInsights!.add(new Blogs.fromJson(v));
      });
    }
    if (json['advisor_reviews'] != null) {
      advisorReviews = <AdvisorReviews>[];
      json['advisor_reviews'].forEach((v) {
        advisorReviews!.add(new AdvisorReviews.fromJson(v));
      });
    }
    if (json['ratings'] != null) {
      ratings = <AdvisorReviews>[];
      json['ratings'].forEach((v) {
        ratings!.add(new AdvisorReviews.fromJson(v));
      });
    }
    photoUrl = json['photo_url'];
    userRating = json['user_ratings'];
    saudaRating = json['sauda_ratings'];
    saudaRatingText = json['sauda_rating_text'];
    financialTitle = json['financial_title'];
    category = json['category'] != null
        ? new Categoryyy.fromJson(json['category'])
        : null;
    if (json['price_range'] != null) {
      priceRange = <PriceRange>[];
      json['price_range'].forEach((v) {
        priceRange!.add(new PriceRange.fromJson(v));
      });
    }
    if (json['financial_information'] != null) {
      financialInformation = <FinancialInformation>[];
      json['financial_information'].forEach((v) {
        financialInformation!.add(new FinancialInformation.fromJson(v));
      });
    }
    if (json['important_information'] != null) {
      importantInformation = <FinancialInformation>[];
      json['important_information'].forEach((v) {
        importantInformation!.add(new FinancialInformation.fromJson(v));
      });
    }
    if (json['news'] != null) {
      json['news'] ?? [];
    /*  news = <Null>[];
      json['news'].forEach((v) {
        news!.add(new Null.fromJson(v));
      });*/
    }
    if (json['reviews'] != null) {
      json['reviews'] ?? [];
    /*  reviews = <Null>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Null.fromJson(v));
      });*/
    }
    if (json['returns'] != null) {
      returns = <Returns>[];
      json['returns'].forEach((v) {
        returns!.add(new Returns.fromJson(v));
      });
    }
    if (json['tentative_value'] != null) {
      tentativeValue = <TentativeValue>[];
      json['tentative_value'].forEach((v) {
        tentativeValue!.add(new TentativeValue.fromJson(v));
      });
    }
    if (json['meta_data'] != null) {
      metaData = <MetaDataa>[];
      json['meta_data'].forEach((v) {
        metaData!.add(new MetaDataa.fromJson(v));
      });
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
    data['wishlist'] = this.wishList;
    if (this.ratingList != null) {
      data['rating_list'] = this.ratingList!.map((v) => v.toJson()).toList();
    }
    if (this.saudaInsights != null) {
      data['sauda_insights'] =
          this.saudaInsights!.map((v) => v.toJson()).toList();
    }
    if (this.advisorReviews != null) {
      data['advisor_reviews'] =
          this.advisorReviews!.map((v) => v.toJson()).toList();
    }
    if (this.ratings != null) {
      data['ratings'] =
          this.ratings!.map((v) => v.toJson()).toList();
    }
    data['photo_url'] = this.photoUrl;
    data['user_ratings'] = this.userRating;
    data['sauda_ratings'] = this.saudaRating;
    data['sauda_rating_text'] = this.saudaRatingText;
    data['financial_title'] = this.financialTitle;
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
    if (this.metaData != null) {
      data['meta_data'] = this.metaData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class AdvisorReviews {
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
  User? user;

  AdvisorReviews(
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
        this.user});

  AdvisorReviews.fromJson(Map<String, dynamic> json) {
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
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
    if (this.user != null) {
      data['user'] = this.user!.toJson();
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
  String? createdAt;
  String? updatedAt;
  String? roleName;
  String? professionName;
  String? photoUrl;
  List<IdProof>? idProof;
  List<IdProof>? userMetaData;
  List<IdProof>? userProfession;

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
        this.createdAt,
        this.updatedAt,
        this.roleName,
        this.professionName,
        this.photoUrl,
        this.idProof,
        this.userMetaData,
        this.userProfession});

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
    if (json['user_meta_data'] != null) {
      userMetaData = <IdProof>[];
      json['user_meta_data'].forEach((v) {
        userMetaData!.add(new IdProof.fromJson(v));
      });
    }
    if (json['user_profession'] != null) {
      userProfession = <IdProof>[];
      json['user_profession'].forEach((v) {
        userProfession!.add(new IdProof.fromJson(v));
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
    if (this.userMetaData != null) {
      data['user_meta_data'] =
          this.userMetaData!.map((v) => v.toJson()).toList();
    }
    if (this.userProfession != null) {
      data['user_profession'] =
          this.userProfession!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class SaudaInsights {
  int? id;
  String? title;
  int? categoryId;
  int? stockId;
  String? description;
  String? image;
  Null? video;
  String? userApp;
  String? type;
  int? status;
  String? createdAt;
  String? updatedAt;
  Stockss? stock;
  Categoryyy? category;
  String? imageUrl;
  String? authorname;

  SaudaInsights(
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
        this.imageUrl,
      this.authorname});

  SaudaInsights.fromJson(Map<String, dynamic> json) {
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
    stock = json['stock'] != null ? new Stockss.fromJson(json['stock']) : null;
    category = json['category'] != null
        ? new Categoryyy.fromJson(json['category'])
        : null;
    imageUrl = json['image_url'];
    authorname = json['author_name'];
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
    data['author_name'] = this.authorname;
    return data;
  }
}
class Categoryyy {
  int? id;
  String? categoryName;
  int? status;
  String? createdAt;
  String? updatedAt;

  Categoryyy(
      {this.id,
        this.categoryName,
        this.status,
        this.createdAt,
        this.updatedAt});

  Categoryyy.fromJson(Map<String, dynamic> json) {
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

class PriceRange {
  int? id;
  int? stockId;
  int? rangeTypeId;
  String? from;
  String? to;
  String? link;
  String? labelText;
  int? status;
  String? createdAt;
  String? updatedAt;

  PriceRange(
      {this.id,
        this.stockId,
        this.rangeTypeId,
        this.from,
        this.to,
        this.link,
        this.labelText,
        this.status,
        this.createdAt,
        this.updatedAt});

  PriceRange.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stockId = json['stock_id'];
    rangeTypeId = json['range_type_id'];
    from = json['from'];
    to = json['to'];
    link = json['link'];
    labelText = json['label_text'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stock_id'] = this.stockId;
    data['range_type_id'] = this.rangeTypeId;
    data['from'] = this.from;
    data['to'] = this.to;
    data['link'] = this.link;
    data['label_text'] = this.labelText;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class FinancialInformation {
  String? particulars;
  List<Dataa>? data;

  FinancialInformation({this.particulars, this.data});

  FinancialInformation.fromJson(Map<String, dynamic> json) {
    particulars = json['particulars'];
    if (json['data'] != null) {
      data = <Dataa>[];
      json['data'].forEach((v) {
        data!.add(new Dataa.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['particulars'] = this.particulars;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dataa {
  String? year;
  String? value;

  Dataa({this.year, this.value});

  Dataa.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['value'] = this.value;
    return data;
  }
}

class Returns {
  int? id;
  int? stockId;
  String? label;
  String? value;
  int? status;
  String? createdAt;
  String? updatedAt;

  Returns(
      {this.id,
        this.stockId,
        this.label,
        this.value,
        this.status,
        this.createdAt,
        this.updatedAt});

  Returns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stockId = json['stock_id'];
    label = json['label'];
    value = json['value'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stock_id'] = this.stockId;
    data['label'] = this.label;
    data['value'] = this.value;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class TentativeValue {
  int? id;
  int? stockId;
  String? valuableText;
  int? status;
  String? createdAt;
  String? updatedAt;

  TentativeValue(
      {this.id,
        this.stockId,
        this.valuableText,
        this.status,
        this.createdAt,
        this.updatedAt});

  TentativeValue.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stockId = json['stock_id'];
    valuableText = json['valuable_text'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stock_id'] = this.stockId;
    data['valuable_text'] = this.valuableText;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class MetaDataa {
  int? id;
  int? stockId;
  String? key;
  String? value;
  List<Data>? data;
  String? type;

  MetaDataa({this.id, this.stockId, this.key, this.value, this.data,this.type});

  MetaDataa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stockId = json['stock_id'];
    key = json['key'];
    value = json['value'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stock_id'] = this.stockId;
    data['key'] = this.key;
    data['value'] = this.value;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['type'] = this.type;
    return data;
  }
}

class Data {
  String? label;
  String? value;

  Data({this.label, this.value});

  Data.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}
