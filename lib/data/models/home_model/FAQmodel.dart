/// status : true
/// faq : [{"id":2,"title":"Do I have to pay for using the platforms?","description":"No. You can check out the Upstox Pro web & mobile platforms for free and open an account only when you’re ready to place a trade. There’s no fee to use the trading software.","user_app":"all","status":1,"created_at":"2022-10-06T03:07:06.000000Z","updated_at":"2023-05-24T04:14:33.000000Z"},{"id":3,"title":"What is the brokerage* cost of trading in Futures and Options?","description":"For Futures, you’ll be charged ₹20* or 0.05% (whichever is lower) per order. For Options, you’ll be charged a flat fee of ₹20* per order. Your maximum brokerage* cost remains ₹20* per order irrespective of the size of the order.","user_app":"all","status":1,"created_at":"2023-05-24T04:14:50.000000Z","updated_at":"2023-05-24T04:14:50.000000Z"},{"id":4,"title":"What are BTST orders?","description":"BTST stands for Buy Today Sell Tomorrow. These are considered as equity delivery trades which means you pay zero brokerage* on these orders.","user_app":"all","status":1,"created_at":"2023-05-24T04:15:11.000000Z","updated_at":"2023-05-24T04:15:11.000000Z"},{"id":5,"title":"What is the difference between Demat & Trading account?","description":"Through the Demat account, investors can hold all the types of investments, such as stocks, ETFs, mutual funds, currency, futures and options. In comparison, a trading account provides you with an interface by which you can buy and sell the stocks in the share market.","user_app":"all","status":1,"created_at":"2023-05-24T04:15:47.000000Z","updated_at":"2023-05-24T04:15:47.000000Z"}]

class FaQmodel {
  FaQmodel({
      bool? status, 
      List<Faq>? faq,}){
    _status = status;
    _faq = faq;
}

  FaQmodel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['faq'] != null) {
      _faq = [];
      json['faq'].forEach((v) {
        _faq?.add(Faq.fromJson(v));
      });
    }
  }
  bool? _status;
  List<Faq>? _faq;
FaQmodel copyWith({  bool? status,
  List<Faq>? faq,
}) => FaQmodel(  status: status ?? _status,
  faq: faq ?? _faq,
);
  bool? get status => _status;
  List<Faq>? get faq => _faq;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_faq != null) {
      map['faq'] = _faq?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// title : "Do I have to pay for using the platforms?"
/// description : "No. You can check out the Upstox Pro web & mobile platforms for free and open an account only when you’re ready to place a trade. There’s no fee to use the trading software."
/// user_app : "all"
/// status : 1
/// created_at : "2022-10-06T03:07:06.000000Z"
/// updated_at : "2023-05-24T04:14:33.000000Z"

class Faq {
  Faq({
      num? id, 
      String? title, 
      String? description, 
      String? userApp, 
      num? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _title = title;
    _description = description;
    _userApp = userApp;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Faq.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _userApp = json['user_app'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _title;
  String? _description;
  String? _userApp;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
Faq copyWith({  num? id,
  String? title,
  String? description,
  String? userApp,
  num? status,
  String? createdAt,
  String? updatedAt,
}) => Faq(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  userApp: userApp ?? _userApp,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get userApp => _userApp;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['user_app'] = _userApp;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}