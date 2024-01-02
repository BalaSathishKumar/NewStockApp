import '../Explore_model/ExploreModel.dart';

class InvestedStocks {
  bool? status;
  Data? data;

  InvestedStocks({this.status, this.data});

  InvestedStocks.fromJson(Map<String, dynamic> json) {
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
  List<Invested>? invested;
  String? folioValue;
  String? totalValue;
  List<Assets>? assets;

  Data({this.invested, this.folioValue,this.totalValue, this.assets});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['invested'] != null) {
      invested = <Invested>[];
      json['invested'].forEach((v) {
        invested!.add(new Invested.fromJson(v));
      });
    }
    folioValue = json['folio_value'];
    totalValue = json['total_value'];
    if (json['assets'] != null) {
      assets = <Assets>[];
      json['assets'].forEach((v) {
        assets!.add(new Assets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.invested != null) {
      data['invested'] = this.invested!.map((v) => v.toJson()).toList();
    }
    data['folio_value'] = this.folioValue;
    data['total_value'] = this.totalValue;
    if (this.assets != null) {
      data['assets'] = this.assets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Invested {
  int? id;
  String? orderNo;
  int? userId;
  int? stockId;
  int? dealerId;
  int? categoryId;
  String? companyName;
  int? quantity;
  String? purposeType;
  int? guidance;
  String? message;
  String? purchaseType;
  dynamic? promocode;
  int? discountAmount;
  int? price;
  int? adminPrice;
  int? buyShareSize;
  int? total;
  int? gtotal;
  String? paymentReferalId;
  dynamic? reason;
  String? payment;
  int? status;
  int? paymentStatus;
  String? createdAt;
  String? updatedAt;
  String? adminPriceType;
  String? dealerName;
  String? statusText;
  String? userType;
  Stocks? stock;
  Category? category;

  Invested(
      {this.id,
        this.orderNo,
        this.userId,
        this.stockId,
        this.dealerId,
        this.categoryId,
        this.companyName,
        this.quantity,
        this.purposeType,
        this.guidance,
        this.message,
        this.purchaseType,
        this.promocode,
        this.discountAmount,
        this.price,
        this.adminPrice,
        this.buyShareSize,
        this.total,
        this.gtotal,
        this.paymentReferalId,
        this.reason,
        this.payment,
        this.status,
        this.paymentStatus,
        this.createdAt,
        this.updatedAt,
        this.adminPriceType,
        this.dealerName,
        this.statusText,
        this.userType,
        this.stock,
        this.category});

  Invested.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderNo = json['order_no'];
    userId = json['user_id'];
    stockId = json['stock_id'];
    dealerId = json['dealer_id'];
    categoryId = json['category_id'];
    companyName = json['company_name'];
    quantity = json['quantity'];
    purposeType = json['purpose_type'];
    guidance = json['guidance'];
    message = json['message'];
    purchaseType = json['purchase_type'];
    promocode = json['promocode'];
    discountAmount = json['discount_amount'];
    price = json['price'];
    adminPrice = json['admin_price'];
    buyShareSize = json['buy_share_size'];
    total = json['total'];
    gtotal = json['gtotal'];
    paymentReferalId = json['payment_referal_id'];
    reason = json['reason'];
    payment = json['payment'];
    status = json['status'];
    paymentStatus = json['payment_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    adminPriceType = json['admin_price_type'];
    dealerName = json['dealer_name'];
    statusText = json['status_text'];
    userType = json['user_type'];
    stock = json['stock'] != null ? new Stocks.fromJson(json['stock']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_no'] = this.orderNo;
    data['user_id'] = this.userId;
    data['stock_id'] = this.stockId;
    data['dealer_id'] = this.dealerId;
    data['category_id'] = this.categoryId;
    data['company_name'] = this.companyName;
    data['quantity'] = this.quantity;
    data['purpose_type'] = this.purposeType;
    data['guidance'] = this.guidance;
    data['message'] = this.message;
    data['purchase_type'] = this.purchaseType;
    data['promocode'] = this.promocode;
    data['discount_amount'] = this.discountAmount;
    data['price'] = this.price;
    data['admin_price'] = this.adminPrice;
    data['buy_share_size'] = this.buyShareSize;
    data['total'] = this.total;
    data['gtotal'] = this.gtotal;
    data['payment_referal_id'] = this.paymentReferalId;
    data['reason'] = this.reason;
    data['payment'] = this.payment;
    data['status'] = this.status;
    data['payment_status'] = this.paymentStatus;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['admin_price_type'] = this.adminPriceType;
    data['dealer_name'] = this.dealerName;
    data['status_text'] = this.statusText;
    data['user_type'] = this.userType;
    if (this.stock != null) {
      data['stock'] = this.stock!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
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

class Assets {
  int? id;
  int? userId;
  String? name;
  int? noOfShares;
  int? assetValue;
  String? purchaseDate;
  String? purchaseFrom;
  String? notes;
  int? status;
  String? createdAt;
  String? updatedAt;

  Assets(
      {this.id,
        this.userId,
        this.name,
        this.noOfShares,
        this.assetValue,
        this.purchaseDate,
        this.purchaseFrom,
        this.notes,
        this.status,
        this.createdAt,
        this.updatedAt});

  Assets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    noOfShares = json['no_of_shares'];
    assetValue = json['asset_value'];
    purchaseDate = json['purchase_date'];
    purchaseFrom = json['purchase_from'];
    notes = json['notes'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['no_of_shares'] = this.noOfShares;
    data['asset_value'] = this.assetValue;
    data['purchase_date'] = this.purchaseDate;
    data['purchase_from'] = this.purchaseFrom;
    data['notes'] = this.notes;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
