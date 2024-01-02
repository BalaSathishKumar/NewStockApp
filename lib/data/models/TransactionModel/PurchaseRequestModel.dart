/// status : true
/// data : {"request":[{"id":10,"order_no":"1694495336","user_id":110,"stock_id":11,"category_id":1,"company_name":"Api Holding","quantity":10,"purpose_type":"individual","guidance":1,"message":"testing","purchase_type":"buy","promocode":null,"discount_amount":0,"price":500,"total":5000,"payment_referal_id":null,"payment":"cash","status":1,"payment_status":0,"created_at":"2023-09-12T05:08:56.000000Z","updated_at":"2023-09-12T05:08:56.000000Z","dealer_name":"Suada Team","status_text":"Pending","stock":{"id":11,"user_id":0,"category_id":1,"slugs":"1ea3e84f-c1f0-4748-bfb5-f9fea0db6938","name":"AV Thomas and Company Ltd","website":"www.avthomas.in","selling_price":"16850","buying_price":"16850","high":21555,"low":11999,"lot_size":"1000","lot_size_limit":"Minimum","coupon_rate":"1","buy_offline":"yes","approximate_margin":"Agriculture/ Plantation Products","maturity":"Agriculture/ Plantation Products","photo":"2a00cb2c-9318-41ec-a59c-8dee105e246c_87216.jpeg","visible":"yes","about":"A V Thomas & Co. Ltd was incorporated during the year 1935 with the main business being Trading, Manufacturing, and Exports.The company headquartered in Cochin, India. The main divison under the company are Products divison,Trading, Logistics, Exports and serivces. Product divison include Packed Tea, Coffee and Premix.The company manufacture roofing materials and aluminium & related accessories. AVT's products are exported to over 50 countries around the world and are highly valued for their taste, quality, and nutritional value.The company’s flagship tea brand “AVT Premium” is the second largest selling dust brand in India and the third biggest brand in the economy sector in total. \r\nThe main business activity of the company is:\r\n1.\tPacked Tea and Coffee.\r\n2.\tAluminum sheets\r\n3.\tCardamom","user_type":"user","admin_id":0,"admin_price":16850,"admin_price_type":"flatrate","featured":1,"status":2,"created_at":"2023-08-30T14:20:20.000000Z","updated_at":"2023-09-02T10:21:57.000000Z","photo_url":"http://sauda.wipspace.in/storage/stocks/2a00cb2c-9318-41ec-a59c-8dee105e246c_87216.jpeg","user_ratings":0,"sauda_ratings":0,"status_text":"Approved"},"category":{"id":1,"category_name":"Unlisted Stocks","status":1,"created_at":"2022-09-29T03:07:31.000000Z","updated_at":"2022-09-29T03:18:39.000000Z"}}],"purchased":[],"sold":[]}

class PurchaseRequestModel {
  PurchaseRequestModel({
      bool? status, 
      Data? data,}){
    _status = status;
    _data = data;
}

  PurchaseRequestModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  Data? _data;
PurchaseRequestModel copyWith({  bool? status,
  Data? data,
}) => PurchaseRequestModel(  status: status ?? _status,
  data: data ?? _data,
);
  bool? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// request : [{"id":10,"order_no":"1694495336","user_id":110,"stock_id":11,"category_id":1,"company_name":"Api Holding","quantity":10,"purpose_type":"individual","guidance":1,"message":"testing","purchase_type":"buy","promocode":null,"discount_amount":0,"price":500,"total":5000,"payment_referal_id":null,"payment":"cash","status":1,"payment_status":0,"created_at":"2023-09-12T05:08:56.000000Z","updated_at":"2023-09-12T05:08:56.000000Z","dealer_name":"Suada Team","status_text":"Pending","stock":{"id":11,"user_id":0,"category_id":1,"slugs":"1ea3e84f-c1f0-4748-bfb5-f9fea0db6938","name":"AV Thomas and Company Ltd","website":"www.avthomas.in","selling_price":"16850","buying_price":"16850","high":21555,"low":11999,"lot_size":"1000","lot_size_limit":"Minimum","coupon_rate":"1","buy_offline":"yes","approximate_margin":"Agriculture/ Plantation Products","maturity":"Agriculture/ Plantation Products","photo":"2a00cb2c-9318-41ec-a59c-8dee105e246c_87216.jpeg","visible":"yes","about":"A V Thomas & Co. Ltd was incorporated during the year 1935 with the main business being Trading, Manufacturing, and Exports.The company headquartered in Cochin, India. The main divison under the company are Products divison,Trading, Logistics, Exports and serivces. Product divison include Packed Tea, Coffee and Premix.The company manufacture roofing materials and aluminium & related accessories. AVT's products are exported to over 50 countries around the world and are highly valued for their taste, quality, and nutritional value.The company’s flagship tea brand “AVT Premium” is the second largest selling dust brand in India and the third biggest brand in the economy sector in total. \r\nThe main business activity of the company is:\r\n1.\tPacked Tea and Coffee.\r\n2.\tAluminum sheets\r\n3.\tCardamom","user_type":"user","admin_id":0,"admin_price":16850,"admin_price_type":"flatrate","featured":1,"status":2,"created_at":"2023-08-30T14:20:20.000000Z","updated_at":"2023-09-02T10:21:57.000000Z","photo_url":"http://sauda.wipspace.in/storage/stocks/2a00cb2c-9318-41ec-a59c-8dee105e246c_87216.jpeg","user_ratings":0,"sauda_ratings":0,"status_text":"Approved"},"category":{"id":1,"category_name":"Unlisted Stocks","status":1,"created_at":"2022-09-29T03:07:31.000000Z","updated_at":"2022-09-29T03:18:39.000000Z"}}]
/// purchased : []
/// sold : []

class Data {
  Data({
      List<Request>? request, 
      List<Request>? sellrequest,
      List<Request>? purchased,
      List<Request>? sold,}){
    _request = request;
    _purchased = purchased;
    _sold = sold;
}

  Data.fromJson(dynamic json) {
    if (json['request'] != null) {
      _request = [];
      json['request'].forEach((v) {
        _request?.add(Request.fromJson(v));
      });
    }
    if (json['sell_request'] != null) {
      _sellrequest = [];
      json['sell_request'].forEach((v) {
        _sellrequest?.add(Request.fromJson(v));
      });
    }
    if (json['purchased'] != null) {
      _purchased = [];
      json['purchased'].forEach((v) {
        _purchased?.add(Request.fromJson(v));
      });
    }
    if (json['sold'] != null) {
      _sold = [];
      json['sold'].forEach((v) {
        _sold?.add(Request.fromJson(v));
      });
    }
  }
  List<Request>? _request;
  List<Request>? _sellrequest;
  List<Request>? _purchased;
  List<Request>? _sold;
Data copyWith({
  List<Request>? request,
  List<Request>? sellrequest,
  List<Request>? purchased,
  List<Request>? sold,
}) => Data(
  request: request ?? _request,
  sellrequest: sellrequest ?? _sellrequest,
  purchased: purchased ?? _purchased,
  sold: sold ?? _sold,
);
  List<Request>? get request => _request;
  List<Request>? get sellrequest => _sellrequest;
  List<Request>? get purchased => _purchased;
  List<Request>? get sold => _sold;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_request != null) {
      map['request'] = _request?.map((v) => v.toJson()).toList();
    }
    if (_sellrequest != null) {
      map['sell_request'] = _sellrequest?.map((v) => v.toJson()).toList();
    }
    if (_purchased != null) {
      map['purchased'] = _purchased?.map((v) => v.toJson()).toList();
    }
    if (_sold != null) {
      map['sold'] = _sold?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 10
/// order_no : "1694495336"
/// user_id : 110
/// stock_id : 11
/// category_id : 1
/// company_name : "Api Holding"
/// quantity : 10
/// purpose_type : "individual"
/// guidance : 1
/// message : "testing"
/// purchase_type : "buy"
/// promocode : null
/// discount_amount : 0
/// price : 500
/// total : 5000
/// payment_referal_id : null
/// payment : "cash"
/// status : 1
/// payment_status : 0
/// created_at : "2023-09-12T05:08:56.000000Z"
/// updated_at : "2023-09-12T05:08:56.000000Z"
/// dealer_name : "Suada Team"
/// status_text : "Pending"
/// stock : {"id":11,"user_id":0,"category_id":1,"slugs":"1ea3e84f-c1f0-4748-bfb5-f9fea0db6938","name":"AV Thomas and Company Ltd","website":"www.avthomas.in","selling_price":"16850","buying_price":"16850","high":21555,"low":11999,"lot_size":"1000","lot_size_limit":"Minimum","coupon_rate":"1","buy_offline":"yes","approximate_margin":"Agriculture/ Plantation Products","maturity":"Agriculture/ Plantation Products","photo":"2a00cb2c-9318-41ec-a59c-8dee105e246c_87216.jpeg","visible":"yes","about":"A V Thomas & Co. Ltd was incorporated during the year 1935 with the main business being Trading, Manufacturing, and Exports.The company headquartered in Cochin, India. The main divison under the company are Products divison,Trading, Logistics, Exports and serivces. Product divison include Packed Tea, Coffee and Premix.The company manufacture roofing materials and aluminium & related accessories. AVT's products are exported to over 50 countries around the world and are highly valued for their taste, quality, and nutritional value.The company’s flagship tea brand “AVT Premium” is the second largest selling dust brand in India and the third biggest brand in the economy sector in total. \r\nThe main business activity of the company is:\r\n1.\tPacked Tea and Coffee.\r\n2.\tAluminum sheets\r\n3.\tCardamom","user_type":"user","admin_id":0,"admin_price":16850,"admin_price_type":"flatrate","featured":1,"status":2,"created_at":"2023-08-30T14:20:20.000000Z","updated_at":"2023-09-02T10:21:57.000000Z","photo_url":"http://sauda.wipspace.in/storage/stocks/2a00cb2c-9318-41ec-a59c-8dee105e246c_87216.jpeg","user_ratings":0,"sauda_ratings":0,"status_text":"Approved"}
/// category : {"id":1,"category_name":"Unlisted Stocks","status":1,"created_at":"2022-09-29T03:07:31.000000Z","updated_at":"2022-09-29T03:18:39.000000Z"}

class Request {
  Request({
      num? id, 
      String? orderNo, 
      num? userId, 
      num? dealerID,
      num? stockId,
      num? categoryId, 
      String? companyName, 
      num? quantity, 
      String? purposeType, 
      num? guidance, 
      String? message, 
      String? purchaseType, 
      dynamic promocode, 
      num? discountAmount, 
      num? price, 
      num? buyshareprice,
      num? total,
      num? gtotal,
      dynamic paymentReferalId,
      String? payment, 
      int? status,
      num? paymentStatus, 
      String? createdAt, 
      String? updatedAt, 
      String? dealerName, 
      String? statusText, 
      Stock? stock, 
      Category? category,}){
    _id = id;
    _orderNo = orderNo;
    _userId = userId;
    _dealerId = dealerID;
    _stockId = stockId;
    _categoryId = categoryId;
    _companyName = companyName;
    _quantity = quantity;
    _purposeType = purposeType;
    _guidance = guidance;
    _message = message;
    _purchaseType = purchaseType;
    _promocode = promocode;
    _discountAmount = discountAmount;
    _buyshareprice = buyshareprice;
    _price = price;
    _total = total;
    _gtotal = gtotal;
    _paymentReferalId = paymentReferalId;
    _payment = payment;
    _status = status;
    _paymentStatus = paymentStatus;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _dealerName = dealerName;
    _statusText = statusText;
    _stock = stock;
    _category = category;
}

  Request.fromJson(dynamic json) {
    _id = json['id'];
    _orderNo = json['order_no'];
    _userId = json['user_id'];
    _dealerId = json['dealer_id'];
    _stockId = json['stock_id'];
    _categoryId = json['category_id'];
    _companyName = json['company_name'];
    _quantity = json['quantity'];
    _purposeType = json['purpose_type'];
    _guidance = json['guidance'];
    _message = json['message'];
    _purchaseType = json['purchase_type'];
    _promocode = json['promocode'];
    _discountAmount = json['discount_amount'];
    _price = json['price'];
    _buyshareprice = json['buy_share_size'];
    _total = json['total'];
    _gtotal = json['gtotal'];
    _paymentReferalId = json['payment_referal_id'];
    _payment = json['payment'];
    _status = json['status'];
    _paymentStatus = json['payment_status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _dealerName = json['dealer_name'];
    _statusText = json['status_text'];
    _stock = json['stock'] != null ? Stock.fromJson(json['stock']) : null;
    _category = json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  num? _id;
  String? _orderNo;
  num? _userId;
  num? _dealerId;
  num? _stockId;
  num? _categoryId;
  String? _companyName;
  num? _quantity;
  String? _purposeType;
  num? _guidance;
  String? _message;
  String? _purchaseType;
  dynamic _promocode;
  num? _discountAmount;
  num? _price;
  num? _buyshareprice;
  num? _total;
  num? _gtotal;
  dynamic _paymentReferalId;
  String? _payment;
  int? _status;
  num? _paymentStatus;
  String? _createdAt;
  String? _updatedAt;
  String? _dealerName;
  String? _statusText;
  Stock? _stock;
  Category? _category;
Request copyWith({  num? id,
  String? orderNo,
  num? userId,
  num? dealerId,
  num? stockId,
  num? categoryId,
  String? companyName,
  num? quantity,
  String? purposeType,
  num? guidance,
  String? message,
  String? purchaseType,
  dynamic promocode,
  num? discountAmount,
  num? price,
  num? buyshareprice,
  num? total,
  num? gtotal,
  dynamic paymentReferalId,
  String? payment,
  int? status,
  num? paymentStatus,
  String? createdAt,
  String? updatedAt,
  String? dealerName,
  String? statusText,
  Stock? stock,
  Category? category,
}) => Request(  id: id ?? _id,
  orderNo: orderNo ?? _orderNo,
  userId: userId ?? _userId,
  dealerID: dealerId ?? _dealerId,
  stockId: stockId ?? _stockId,
  categoryId: categoryId ?? _categoryId,
  companyName: companyName ?? _companyName,
  quantity: quantity ?? _quantity,
  purposeType: purposeType ?? _purposeType,
  guidance: guidance ?? _guidance,
  message: message ?? _message,
  purchaseType: purchaseType ?? _purchaseType,
  promocode: promocode ?? _promocode,
  discountAmount: discountAmount ?? _discountAmount,
  buyshareprice: buyshareprice ?? _buyshareprice,
  price: price ?? _price,
  total: total ?? _total,
  gtotal: gtotal ?? _gtotal,
  paymentReferalId: paymentReferalId ?? _paymentReferalId,
  payment: payment ?? _payment,
  status: status ?? _status,
  paymentStatus: paymentStatus ?? _paymentStatus,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  dealerName: dealerName ?? _dealerName,
  statusText: statusText ?? _statusText,
  stock: stock ?? _stock,
  category: category ?? _category,
);
  num? get id => _id;
  String? get orderNo => _orderNo;
  num? get userId => _userId;
  num? get dealerId => _dealerId;
  num? get stockId => _stockId;
  num? get categoryId => _categoryId;
  String? get companyName => _companyName;
  num? get quantity => _quantity;
  String? get purposeType => _purposeType;
  num? get guidance => _guidance;
  String? get message => _message;
  String? get purchaseType => _purchaseType;
  dynamic get promocode => _promocode;
  num? get discountAmount => _discountAmount;
  num? get buyshareprice => _buyshareprice;
  num? get price => _price;
  num? get total => _total;
  num? get gtotal => _gtotal;
  dynamic get paymentReferalId => _paymentReferalId;
  String? get payment => _payment;
  int? get status => _status;
  num? get paymentStatus => _paymentStatus;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get dealerName => _dealerName;
  String? get statusText => _statusText;
  Stock? get stock => _stock;
  Category? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['order_no'] = _orderNo;
    map['user_id'] = _userId;
    map['dealer_id'] = _dealerId;
    map['stock_id'] = _stockId;
    map['category_id'] = _categoryId;
    map['company_name'] = _companyName;
    map['quantity'] = _quantity;
    map['purpose_type'] = _purposeType;
    map['guidance'] = _guidance;
    map['message'] = _message;
    map['purchase_type'] = _purchaseType;
    map['promocode'] = _promocode;
    map['discount_amount'] = _discountAmount;
    map['buy_share_size'] = _buyshareprice;
    map['price'] = _price;
    map['total'] = _total;
    map['gtotal'] = _gtotal;
    map['payment_referal_id'] = _paymentReferalId;
    map['payment'] = _payment;
    map['status'] = _status;
    map['payment_status'] = _paymentStatus;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['dealer_name'] = _dealerName;
    map['status_text'] = _statusText;
    if (_stock != null) {
      map['stock'] = _stock?.toJson();
    }
    if (_category != null) {
      map['category'] = _category?.toJson();
    }
    return map;
  }

}

/// id : 1
/// category_name : "Unlisted Stocks"
/// status : 1
/// created_at : "2022-09-29T03:07:31.000000Z"
/// updated_at : "2022-09-29T03:18:39.000000Z"

class Category {
  Category({
      num? id, 
      String? categoryName, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _categoryName = categoryName;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _categoryName = json['category_name'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _categoryName;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
Category copyWith({  num? id,
  String? categoryName,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => Category(  id: id ?? _id,
  categoryName: categoryName ?? _categoryName,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get categoryName => _categoryName;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['category_name'] = _categoryName;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

/// id : 11
/// user_id : 0
/// category_id : 1
/// slugs : "1ea3e84f-c1f0-4748-bfb5-f9fea0db6938"
/// name : "AV Thomas and Company Ltd"
/// website : "www.avthomas.in"
/// selling_price : "16850"
/// buying_price : "16850"
/// high : 21555
/// low : 11999
/// lot_size : "1000"
/// lot_size_limit : "Minimum"
/// coupon_rate : "1"
/// buy_offline : "yes"
/// approximate_margin : "Agriculture/ Plantation Products"
/// maturity : "Agriculture/ Plantation Products"
/// photo : "2a00cb2c-9318-41ec-a59c-8dee105e246c_87216.jpeg"
/// visible : "yes"
/// about : "A V Thomas & Co. Ltd was incorporated during the year 1935 with the main business being Trading, Manufacturing, and Exports.The company headquartered in Cochin, India. The main divison under the company are Products divison,Trading, Logistics, Exports and serivces. Product divison include Packed Tea, Coffee and Premix.The company manufacture roofing materials and aluminium & related accessories. AVT's products are exported to over 50 countries around the world and are highly valued for their taste, quality, and nutritional value.The company’s flagship tea brand “AVT Premium” is the second largest selling dust brand in India and the third biggest brand in the economy sector in total. \r\nThe main business activity of the company is:\r\n1.\tPacked Tea and Coffee.\r\n2.\tAluminum sheets\r\n3.\tCardamom"
/// user_type : "user"
/// admin_id : 0
/// admin_price : 16850
/// admin_price_type : "flatrate"
/// featured : 1
/// status : 2
/// created_at : "2023-08-30T14:20:20.000000Z"
/// updated_at : "2023-09-02T10:21:57.000000Z"
/// photo_url : "http://sauda.wipspace.in/storage/stocks/2a00cb2c-9318-41ec-a59c-8dee105e246c_87216.jpeg"
/// user_ratings : 0
/// sauda_ratings : 0
/// status_text : "Approved"

class Stock {
  Stock({
      num? id, 
      num? userId, 
      num? categoryId, 
      String? slugs, 
      String? name, 
      String? website, 
      String? sellingPrice, 
      String? buyingPrice, 
      num? high, 
      num? low, 
      String? lotSize, 
      String? lotSizeLimit, 
      String? couponRate, 
      String? buyOffline, 
      String? approximateMargin, 
      String? maturity, 
      String? photo, 
      String? visible, 
      String? about, 
      String? userType, 
      num? adminId, 
      num? adminPrice, 
      String? adminPriceType, 
      num? featured, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      String? photoUrl, 
      dynamic? userRatings,
      dynamic? saudaRatings,
      String? statusText,}){
    _id = id;
    _userId = userId;
    _categoryId = categoryId;
    _slugs = slugs;
    _name = name;
    _website = website;
    _sellingPrice = sellingPrice;
    _buyingPrice = buyingPrice;
    _high = high;
    _low = low;
    _lotSize = lotSize;
    _lotSizeLimit = lotSizeLimit;
    _couponRate = couponRate;
    _buyOffline = buyOffline;
    _approximateMargin = approximateMargin;
    _maturity = maturity;
    _photo = photo;
    _visible = visible;
    _about = about;
    _userType = userType;
    _adminId = adminId;
    _adminPrice = adminPrice;
    _adminPriceType = adminPriceType;
    _featured = featured;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _photoUrl = photoUrl;
    _userRatings = userRatings;
    _saudaRatings = saudaRatings;
    _statusText = statusText;
}

  Stock.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _categoryId = json['category_id'];
    _slugs = json['slugs'];
    _name = json['name'];
    _website = json['website'];
    _sellingPrice = json['selling_price'];
    _buyingPrice = json['buying_price'];
    _high = json['high'];
    _low = json['low'];
    _lotSize = json['lot_size'];
    _lotSizeLimit = json['lot_size_limit'];
    _couponRate = json['coupon_rate'];
    _buyOffline = json['buy_offline'];
    _approximateMargin = json['approximate_margin'];
    _maturity = json['maturity'];
    _photo = json['photo'];
    _visible = json['visible'];
    _about = json['about'];
    _userType = json['user_type'];
    _adminId = json['admin_id'];
    _adminPrice = json['admin_price'];
    _adminPriceType = json['admin_price_type'];
    _featured = json['featured'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _photoUrl = json['photo_url'];
    _userRatings = json['user_ratings'];
    _saudaRatings = json['sauda_ratings'];
    _statusText = json['status_text'];
  }
  num? _id;
  num? _userId;
  num? _categoryId;
  String? _slugs;
  String? _name;
  String? _website;
  String? _sellingPrice;
  String? _buyingPrice;
  num? _high;
  num? _low;
  String? _lotSize;
  String? _lotSizeLimit;
  String? _couponRate;
  String? _buyOffline;
  String? _approximateMargin;
  String? _maturity;
  String? _photo;
  String? _visible;
  String? _about;
  String? _userType;
  num? _adminId;
  num? _adminPrice;
  String? _adminPriceType;
  num? _featured;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _photoUrl;
  dynamic? _userRatings;
  dynamic? _saudaRatings;
  String? _statusText;
Stock copyWith({  num? id,
  num? userId,
  num? categoryId,
  String? slugs,
  String? name,
  String? website,
  String? sellingPrice,
  String? buyingPrice,
  num? high,
  num? low,
  String? lotSize,
  String? lotSizeLimit,
  String? couponRate,
  String? buyOffline,
  String? approximateMargin,
  String? maturity,
  String? photo,
  String? visible,
  String? about,
  String? userType,
  num? adminId,
  num? adminPrice,
  String? adminPriceType,
  num? featured,
  num? status,
  String? createdAt,
  String? updatedAt,
  String? photoUrl,
  num? userRatings,
  num? saudaRatings,
  String? statusText,
}) => Stock(  id: id ?? _id,
  userId: userId ?? _userId,
  categoryId: categoryId ?? _categoryId,
  slugs: slugs ?? _slugs,
  name: name ?? _name,
  website: website ?? _website,
  sellingPrice: sellingPrice ?? _sellingPrice,
  buyingPrice: buyingPrice ?? _buyingPrice,
  high: high ?? _high,
  low: low ?? _low,
  lotSize: lotSize ?? _lotSize,
  lotSizeLimit: lotSizeLimit ?? _lotSizeLimit,
  couponRate: couponRate ?? _couponRate,
  buyOffline: buyOffline ?? _buyOffline,
  approximateMargin: approximateMargin ?? _approximateMargin,
  maturity: maturity ?? _maturity,
  photo: photo ?? _photo,
  visible: visible ?? _visible,
  about: about ?? _about,
  userType: userType ?? _userType,
  adminId: adminId ?? _adminId,
  adminPrice: adminPrice ?? _adminPrice,
  adminPriceType: adminPriceType ?? _adminPriceType,
  featured: featured ?? _featured,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  photoUrl: photoUrl ?? _photoUrl,
  userRatings: userRatings ?? _userRatings,
  saudaRatings: saudaRatings ?? _saudaRatings,
  statusText: statusText ?? _statusText,
);
  num? get id => _id;
  num? get userId => _userId;
  num? get categoryId => _categoryId;
  String? get slugs => _slugs;
  String? get name => _name;
  String? get website => _website;
  String? get sellingPrice => _sellingPrice;
  String? get buyingPrice => _buyingPrice;
  num? get high => _high;
  num? get low => _low;
  String? get lotSize => _lotSize;
  String? get lotSizeLimit => _lotSizeLimit;
  String? get couponRate => _couponRate;
  String? get buyOffline => _buyOffline;
  String? get approximateMargin => _approximateMargin;
  String? get maturity => _maturity;
  String? get photo => _photo;
  String? get visible => _visible;
  String? get about => _about;
  String? get userType => _userType;
  num? get adminId => _adminId;
  num? get adminPrice => _adminPrice;
  String? get adminPriceType => _adminPriceType;
  num? get featured => _featured;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get photoUrl => _photoUrl;
  num? get userRatings => _userRatings;
  num? get saudaRatings => _saudaRatings;
  String? get statusText => _statusText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['category_id'] = _categoryId;
    map['slugs'] = _slugs;
    map['name'] = _name;
    map['website'] = _website;
    map['selling_price'] = _sellingPrice;
    map['buying_price'] = _buyingPrice;
    map['high'] = _high;
    map['low'] = _low;
    map['lot_size'] = _lotSize;
    map['lot_size_limit'] = _lotSizeLimit;
    map['coupon_rate'] = _couponRate;
    map['buy_offline'] = _buyOffline;
    map['approximate_margin'] = _approximateMargin;
    map['maturity'] = _maturity;
    map['photo'] = _photo;
    map['visible'] = _visible;
    map['about'] = _about;
    map['user_type'] = _userType;
    map['admin_id'] = _adminId;
    map['admin_price'] = _adminPrice;
    map['admin_price_type'] = _adminPriceType;
    map['featured'] = _featured;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['photo_url'] = _photoUrl;
    map['user_ratings'] = _userRatings;
    map['sauda_ratings'] = _saudaRatings;
    map['status_text'] = _statusText;
    return map;
  }

}