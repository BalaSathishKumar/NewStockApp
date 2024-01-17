import '../dashboard_model/DashboardResponseModel.dart';

class ExploreModel {
  bool? status;
  Data? data;

  ExploreModel({this.status, this.data});

  ExploreModel.fromJson(Map<String, dynamic> json) {
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
  List<Stocks>? stocks;
  Pageing? pageing;

  Data({this.stocks, this.pageing});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['stocks'] != null) {
      stocks = <Stocks>[];
      json['stocks'].forEach((v) {
        stocks!.add(new Stocks.fromJson(v));
      });
    }
    pageing =
    json['pageing'] != null ? new Pageing.fromJson(json['pageing']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stocks != null) {
      data['stocks'] = this.stocks!.map((v) => v.toJson()).toList();
    }
    if (this.pageing != null) {
      data['pageing'] = this.pageing!.toJson();
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
  String? priceMeta;
  dynamic? High;
  dynamic? Low;
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
  String? userRating;
  String? saudaRating;
  String? statusText;
  String? colorText;
  bool? wishList;
  DealerDetails? dealerDetails;
  List<CategoryButtons>? categoryButtons;
  List<ListData>? listData;
  Category? category;

  Stocks(
      {this.id,
        this.userId,
        this.categoryId,
        this.slugs,
        this.name,
        this.website,
        this.sellingPrice,
        this.buyingPrice,
        this.priceMeta,
        this.High,
        this.Low,
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
        this.userRating,
        this.saudaRating,
        this.statusText,
        this.colorText,
        this.dealerDetails,
        this.categoryButtons,
      this.wishList,
        this.listData,
        this.category,});

  Stocks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    slugs = json['slugs'];
    name = json['name'];
    website = json['website'];
    sellingPrice = json['selling_price'];
    buyingPrice = json['buying_price'];
    priceMeta = json['price_meta'];
    High = json['high'];
    Low = json['low'];
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
    userRating = json['user_ratings'];
    saudaRating = json['sauda_ratings'];
    statusText = json['status_text'];
    colorText = json['color_text'];
    dealerDetails = json['dealer_details'] != null ? new DealerDetails.fromJson(json['dealer_details']) : null;
    if (json['category_buttons'] != null) {
      categoryButtons = <CategoryButtons>[];
      json['category_buttons'].forEach((v) {
        categoryButtons!.add(new CategoryButtons.fromJson(v));
      });
    }
    wishList = json['wishlist'];
    if (json['list_data'] != null) {
      listData = <ListData>[];
      json['list_data'].forEach((v) {
        listData!.add(new ListData.fromJson(v));
      });
    }
    category = json['category'] != null ? new Category.fromJson(json['category']) : null;
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
    data['price_meta'] = this.priceMeta;
    data['high'] = this.High;
    data['low'] = this.Low;
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
    data['photo_url'] = this.photoUrl;
    data['user_ratings'] = this.userRating;
    data['sauda_ratings'] = this.saudaRating;
    data['status_text'] = this.statusText;
    data['color_text'] = this.colorText;
    if (this.dealerDetails != null) {
      data['dealer_details'] = this.dealerDetails!.toJson();
    }
    if (this.categoryButtons != null) {
      data['category_buttons'] =
          this.categoryButtons!.map((v) => v.toJson()).toList();
    }
    if (this.listData != null) {
      data['list_data'] = this.listData!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class CategoryButtons {
  int? id;
  int? categoryId;
  String? buttonName;
  String? link;
  int? status;
  String? createdAt;
  String? updatedAt;

  CategoryButtons(
      {this.id,
        this.categoryId,
        this.buttonName,
        this.link,
        this.status,
        this.createdAt,
        this.updatedAt});

  CategoryButtons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    buttonName = json['button_name'];
    link = json['link'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['button_name'] = this.buttonName;
    data['link'] = this.link;
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

class Pageing {
  int? currentPage;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Pageing(
      {this.currentPage,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Pageing.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
