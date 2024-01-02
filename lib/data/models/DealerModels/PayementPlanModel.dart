/// status : true
/// plans : [{"id":8,"title":"Daily (charged daily) - 10 R","description":"Daily (charged daily) - 10 R","amount":10,"duration_type":"daily","duration":1,"interval":1,"plan_id":null,"role_id":2,"stock_count":110,"status":1,"created_at":"2023-09-29T11:08:13.000000Z","updated_at":"2023-09-29T11:08:13.000000Z","role_name":"Brokers"},{"id":9,"title":"Weekly (charged weekly) - 40 Rs","description":"Weekly (charged weekly) - 40 Rs","amount":40,"duration_type":"weekly","duration":7,"interval":1,"plan_id":null,"role_id":2,"stock_count":100,"status":1,"created_at":"2023-09-29T11:08:35.000000Z","updated_at":"2023-09-29T11:08:35.000000Z","role_name":"Brokers"},{"id":10,"title":"Monthly (charged monthly) - 90 Rs","description":"Monthly (charged monthly) - 90 Rs","amount":90,"duration_type":"monthly","duration":30,"interval":1,"plan_id":null,"role_id":2,"stock_count":110,"status":1,"created_at":"2023-09-29T11:08:54.000000Z","updated_at":"2023-09-29T11:08:54.000000Z","role_name":"Brokers"},{"id":11,"title":"Annually (charges annually) - 380 R","description":"Annually (charges annually) - 380 R","amount":380,"duration_type":"yearly","duration":365,"interval":1,"plan_id":null,"role_id":2,"stock_count":1000,"status":1,"created_at":"2023-09-29T11:09:17.000000Z","updated_at":"2023-09-29T11:09:17.000000Z","role_name":"Brokers"}]

class PayementPlanModel {
  PayementPlanModel({
      bool? status, 
      List<Plans>? plans,}){
    _status = status;
    _plans = plans;
}

  PayementPlanModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['plans'] != null) {
      _plans = [];
      json['plans'].forEach((v) {
        _plans?.add(Plans.fromJson(v));
      });
    }
  }
  bool? _status;
  List<Plans>? _plans;
PayementPlanModel copyWith({  bool? status,
  List<Plans>? plans,
}) => PayementPlanModel(  status: status ?? _status,
  plans: plans ?? _plans,
);
  bool? get status => _status;
  List<Plans>? get plans => _plans;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_plans != null) {
      map['plans'] = _plans?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 8
/// title : "Daily (charged daily) - 10 R"
/// description : "Daily (charged daily) - 10 R"
/// amount : 10
/// duration_type : "daily"
/// duration : 1
/// interval : 1
/// plan_id : null
/// role_id : 2
/// stock_count : 110
/// status : 1
/// created_at : "2023-09-29T11:08:13.000000Z"
/// updated_at : "2023-09-29T11:08:13.000000Z"
/// role_name : "Brokers"

class Plans {
  Plans({
      num? id, 
      String? title, 
      String? description, 
      num? amount, 
      String? durationType, 
      num? duration, 
      num? interval, 
      dynamic planId, 
      num? roleId, 
      num? stockCount, 
      num? status, 
      String? createdAt, 
      String? updatedAt, 
      String? roleName,}){
    _id = id;
    _title = title;
    _description = description;
    _amount = amount;
    _durationType = durationType;
    _duration = duration;
    _interval = interval;
    _planId = planId;
    _roleId = roleId;
    _stockCount = stockCount;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _roleName = roleName;
}

  Plans.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _amount = json['amount'];
    _durationType = json['duration_type'];
    _duration = json['duration'];
    _interval = json['interval'];
    _planId = json['plan_id'];
    _roleId = json['role_id'];
    _stockCount = json['stock_count'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _roleName = json['role_name'];
  }
  num? _id;
  String? _title;
  String? _description;
  num? _amount;
  String? _durationType;
  num? _duration;
  num? _interval;
  dynamic _planId;
  num? _roleId;
  num? _stockCount;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _roleName;
Plans copyWith({  num? id,
  String? title,
  String? description,
  num? amount,
  String? durationType,
  num? duration,
  num? interval,
  dynamic planId,
  num? roleId,
  num? stockCount,
  num? status,
  String? createdAt,
  String? updatedAt,
  String? roleName,
}) => Plans(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  amount: amount ?? _amount,
  durationType: durationType ?? _durationType,
  duration: duration ?? _duration,
  interval: interval ?? _interval,
  planId: planId ?? _planId,
  roleId: roleId ?? _roleId,
  stockCount: stockCount ?? _stockCount,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  roleName: roleName ?? _roleName,
);
  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  num? get amount => _amount;
  String? get durationType => _durationType;
  num? get duration => _duration;
  num? get interval => _interval;
  dynamic get planId => _planId;
  num? get roleId => _roleId;
  num? get stockCount => _stockCount;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get roleName => _roleName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['amount'] = _amount;
    map['duration_type'] = _durationType;
    map['duration'] = _duration;
    map['interval'] = _interval;
    map['plan_id'] = _planId;
    map['role_id'] = _roleId;
    map['stock_count'] = _stockCount;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['role_name'] = _roleName;
    return map;
  }

}