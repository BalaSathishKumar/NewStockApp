import 'package:base_flutter_provider_project/data/models/User_Directory_model/ChatUsersList.dart';
import '../Explore_model/ExploreModel.dart';

class DashboardResponseModel {
  bool? status;
  Data? data;

  DashboardResponseModel({this.status, this.data});

  DashboardResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<Banners>? banners;
  List<Category>? category;
  List<Stocks>? stocks;
  List<IpoFpo>? ipoFpo;
  List<FeaturedStocks>? featuredStocks;
  List<FeaturedStocks>? trendingstocks;
  List<FeaturedAdvisors>? featuredAdvisors;
  List<FeaturedBroker>? featuredBrokers;

  Data(
      {this.banners,
        this.category,
        this.stocks,
        this.ipoFpo,
        this.featuredStocks,
        this.trendingstocks,
        this.featuredAdvisors,
        this.featuredBrokers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(new Banners.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['stocks'] != null) {
      stocks = <Stocks>[];
      json['stocks'].forEach((v) {
        stocks!.add(new Stocks.fromJson(v));
      });
    }
    if (json['ipo_fpo'] != null) {
      ipoFpo = <IpoFpo>[];
      json['ipo_fpo'].forEach((v) {
        ipoFpo!.add(new IpoFpo.fromJson(v));
      });
    }
    if (json['featured_stocks'] != null) {
      featuredStocks = <FeaturedStocks>[];
      json['featured_stocks'].forEach((v) {
        featuredStocks!.add(new FeaturedStocks.fromJson(v));
      });
    }
    if (json['trending_stocks'] != null) {
      trendingstocks = <FeaturedStocks>[];
      json['trending_stocks'].forEach((v) {
        trendingstocks!.add(new FeaturedStocks.fromJson(v));
      });
    }
    if (json['featured_advisors'] != null) {
      featuredAdvisors = <FeaturedAdvisors>[];
      json['featured_advisors'].forEach((v) {
        featuredAdvisors!.add(new FeaturedAdvisors.fromJson(v));
      });
    }
    if (json['featured_brokers'] != null) {
      json['featured_brokers'] ?? [];
      featuredBrokers = <FeaturedBroker>[];
      json['featured_brokers'].forEach((v) {
        featuredBrokers!.add(new FeaturedBroker.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banners != null) {
      data['banners'] = this.banners!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.stocks != null) {
      data['stocks'] = this.stocks!.map((v) => v.toJson()).toList();
    }
    if (this.ipoFpo != null) {
      data['ipo_fpo'] = this.ipoFpo!.map((v) => v.toJson()).toList();
    }
    if (this.featuredStocks != null) {
      data['featured_stocks'] =
          this.featuredStocks!.map((v) => v.toJson()).toList();
    }
    if (this.trendingstocks != null) {
      data['trending_stocks'] =
          this.trendingstocks!.map((v) => v.toJson()).toList();
    }
    if (this.featuredAdvisors != null) {
      data['featured_advisors'] =
          this.featuredAdvisors!.map((v) => v.toJson()).toList();
    }
    if (this.featuredBrokers != null) {
      data['featured_brokers'] =
          this.featuredBrokers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Banners {
  int? id;
  String? title;
  String? description;
  String? image;
  String? stockLink;
  String? roles;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Banners(
      {this.id,
        this.title,
        this.description,
        this.image,
        this.stockLink,
        this.roles,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.imageUrl});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    stockLink = json['stock_link'];
    roles = json['roles'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['stock_link'] = this.stockLink;
    data['roles'] = this.roles;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;
  int? status;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
        this.categoryName,
        this.status,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
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

/*
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
        this.photoUrl,});

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
*/

class IpoFpo {
  int? id;
  int? featuredId;
  String? moduleType;
  int? status;
  String? createdAt;
  String? updatedAt;
  Stocks? stock;
  DashUser? user;

  IpoFpo(
      {this.id,
        this.featuredId,
        this.moduleType,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.stock,
        this.user});

  IpoFpo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    featuredId = json['featured_id'];
    moduleType = json['module_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stock = json['stock'] != null ? new Stocks.fromJson(json['stock']) : null;
    user = json['user']!= null ? new DashUser.fromJson(json['stock']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['featured_id'] = this.featuredId;
    data['module_type'] = this.moduleType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.stock != null) {
      data['stock'] = this.stock!.toJson();
    }
    data['user'] = this.user;
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
  num? adminId;
  num? adminPrice;
  String? adminPriceType;
  int? featured;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? photoUrl;
  Category? category;
  List<PriceRange>? priceRange;
  List<FinancialInformation>? financialInformation;
  List<dynamic>? importantInformation;
  List<dynamic>? news;
  List<dynamic>? reviews;
  List<Returns>? returns;
  List<TentativeValue>? tentativeValue;

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
        ? new Category.fromJson(json['category'])
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
    /*  news = <dynamic>[];
      json['news'].forEach((v) {
        news!.add(new Null.fromJson(v));
      });*/
    }
    if (json['reviews'] != null) {
      json['reviews'] ?? [];
  /*    reviews = <Null>[];
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
          this.importantInformation!.map((v) => v?.toJson()).toList();
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
  int? id;
  int? stockId;
  String? particulars;
  String? year;
  String? value;
  int? status;
  String? createdAt;
  String? updatedAt;

  FinancialInformation(
      {this.id,
        this.stockId,
        this.particulars,
        this.year,
        this.value,
        this.status,
        this.createdAt,
        this.updatedAt});

  FinancialInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stockId = json['stock_id'];
    particulars = json['particulars'];
    year = json['year'];
    value = json['value'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stock_id'] = this.stockId;
    data['particulars'] = this.particulars;
    data['year'] = this.year;
    data['value'] = this.value;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

class FeaturedAdvisors {
  int? id;
  int? featuredId;
  String? moduleType;
  int? status;
  String? createdAt;
  String? updatedAt;
  Stocks? stock;
  DashUser? user;

  FeaturedAdvisors(
      {this.id,
        this.featuredId,
        this.moduleType,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.stock,
        this.user});

  FeaturedAdvisors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    featuredId = json['featured_id'];
    moduleType = json['module_type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    stock = json['stock']!= null ? new Stocks.fromJson(json['user']) : null;
    user = json['user'] != null ? new DashUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['featured_id'] = this.featuredId;
    data['module_type'] = this.moduleType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['stock'] = this.stock;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class FeaturedBroker {
  int? id;
  int? featuredId;
  String? moduleType;
  int? status;
  String? createdAt;
  String? updatedAt;
  Stocks? stock;
  DashUser? user;

  FeaturedBroker({
     this.id,
     this.featuredId,
     this.moduleType,
     this.status,
     this.createdAt,
     this.updatedAt,
     this.stock,
     this.user,
  });

  factory FeaturedBroker.fromJson(Map<String, dynamic> json) => FeaturedBroker(
    id: json["id"],
    featuredId: json["featured_id"],
    moduleType: json["module_type"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    stock: Stocks.fromJson(json["stock"]),
    user: DashUser.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "featured_id": featuredId,
    "module_type": moduleType,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "stock": stock,
    "user": user?.toJson(),
  };
}

class FeaturedStocks {
  final int? id;
  final int? featuredId;
  final String? moduleType;
  final int? status;
  final String? createdAt;
  final String? updatedAt;
  final Stocks? stock;


  FeaturedStocks({
    required this.id,
    required this.featuredId,
    required this.moduleType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.stock,

  });

  factory FeaturedStocks.fromJson(Map<String, dynamic> json) {
    return FeaturedStocks(
      id: json['id'],
      featuredId: json['featured_id'],
      moduleType: json['module_type'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      stock: Stocks.fromJson(json['stock']),

    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['featured_id'] = this.featuredId;
    data['module_type'] = this.moduleType;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.stock != null) {
      data['stock'] = this.stock!.toJson();
    }

    return data;
  }

}

class DashUser {
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
  List<UserMetaData>? userMetaData;
  bool? chatEnable;
  String? ratings;

  DashUser(
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
        this.chatEnable,
      this.ratings});

  DashUser.fromJson(Map<String, dynamic> json) {
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
      userMetaData = <UserMetaData>[];
      json['user_meta_data'].forEach((v) {
        userMetaData!.add(new UserMetaData.fromJson(v));
      });
    }
    chatEnable = json['chat_enable'];
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
    data['chat_enable'] = this.chatEnable;
    data['ratings'] = this.ratings;
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