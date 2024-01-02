/// status : true
/// promocode : [{"id":2,"title":"testing","description":"testing","promocode":"TEST100","category_id":1,"amount":100,"type":"fixed","from_date":"2022-10-03","to_date":"2022-10-29","status":1,"created_at":"2022-10-02T20:47:01.000000Z","updated_at":"2022-10-29T02:01:48.000000Z"}]

class PromocodeModel {
  PromocodeModel({
      bool? status, 
      List<Promocode>? promocode,}){
    _status = status;
    _promocode = promocode;
}

  PromocodeModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['promocode'] != null) {
      _promocode = [];
      json['promocode'].forEach((v) {
        _promocode?.add(Promocode.fromJson(v));
      });
    }
  }
  bool? _status;
  List<Promocode>? _promocode;
PromocodeModel copyWith({  bool? status,
  List<Promocode>? promocode,
}) => PromocodeModel(  status: status ?? _status,
  promocode: promocode ?? _promocode,
);
  bool? get status => _status;
  List<Promocode>? get promocode => _promocode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_promocode != null) {
      map['promocode'] = _promocode?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 2
/// title : "testing"
/// description : "testing"
/// promocode : "TEST100"
/// category_id : 1
/// amount : 100
/// type : "fixed"
/// from_date : "2022-10-03"
/// to_date : "2022-10-29"
/// status : 1
/// created_at : "2022-10-02T20:47:01.000000Z"
/// updated_at : "2022-10-29T02:01:48.000000Z"

class Promocode {
  Promocode({
      num? id, 
      String? title, 
      String? description, 
      String? promocode, 
      num? categoryId, 
      num? amount, 
      String? type, 
      String? fromDate, 
      String? toDate, 
      num? status, 
      String? createdAt, 
      String? updatedAt,
      String? statustext,
      String? categoryname,
  }){
    _id = id;
    _title = title;
    _description = description;
    _promocode = promocode;
    _categoryId = categoryId;
    _amount = amount;
    _type = type;
    _fromDate = fromDate;
    _toDate = toDate;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _statustext = statustext;
    _categoryname = categoryname;
}

  Promocode.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _promocode = json['promocode'];
    _categoryId = json['category_id'];
    _amount = json['amount'];
    _type = json['type'];
    _fromDate = json['from_date'];
    _toDate = json['to_date'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _statustext = json['status_text'];
    _categoryname = json['category_name'];
  }
  num? _id;
  String? _title;
  String? _description;
  String? _promocode;
  num? _categoryId;
  num? _amount;
  String? _type;
  String? _fromDate;
  String? _toDate;
  num? _status;
  String? _createdAt;
  String? _updatedAt;
  String? _statustext;
  String? _categoryname;
Promocode copyWith({  num? id,
  String? title,
  String? description,
  String? promocode,
  num? categoryId,
  num? amount,
  String? type,
  String? fromDate,
  String? toDate,
  num? status,
  String? createdAt,
  String? updatedAt,
  String? statustext,
  String? categoryname,
}) => Promocode(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  promocode: promocode ?? _promocode,
  categoryId: categoryId ?? _categoryId,
  amount: amount ?? _amount,
  type: type ?? _type,
  fromDate: fromDate ?? _fromDate,
  toDate: toDate ?? _toDate,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  statustext: statustext ?? _statustext,
  categoryname: categoryname ?? _categoryname,
);
  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get promocode => _promocode;
  num? get categoryId => _categoryId;
  num? get amount => _amount;
  String? get type => _type;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  num? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get statustext => _statustext;
  String? get categoryname => _categoryname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['promocode'] = _promocode;
    map['category_id'] = _categoryId;
    map['amount'] = _amount;
    map['type'] = _type;
    map['from_date'] = _fromDate;
    map['to_date'] = _toDate;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['status_text'] = _statustext;
    map['category_name'] = _categoryname;
    return map;
  }

}