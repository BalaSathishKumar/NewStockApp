/// status : true
/// slider : [{"id":10,"title":"Trade stocks, smarter. ","description":"Having 60+ years of experience, trust us to help you trade safely online. Please provide a USP of your business here in not more than 3 lines.","image":"Group.svg","button":null,"type":"slider","url":null,"status":1,"created_at":null,"updated_at":null,"image_url":"http://sauda.wipspace.in/storage/contents/Group.svg","type_text":null},{"id":11,"title":"Trade stocks, smarter. ","description":"Having 60+ years of experience, trust us to help you trade safely online. Please provide a USP of your business here in not more than 3 lines.","image":"Group.svg","button":null,"type":"slider","url":null,"status":1,"created_at":null,"updated_at":null,"image_url":"http://sauda.wipspace.in/storage/contents/Group.svg","type_text":null},{"id":12,"title":"Trade stocks, smarter. ","description":"Having 60+ years of experience, trust us to help you trade safely online. Please provide a USP of your business here in not more than 3 lines.","image":"Group.svg","button":null,"type":"slider","url":null,"status":1,"created_at":null,"updated_at":null,"image_url":"http://sauda.wipspace.in/storage/contents/Group.svg","type_text":null}]

class OnBoardScreenModel {
  OnBoardScreenModel({
      bool? status, 
      List<NewSlider>? slider,}){
    _status = status;
    _slider = slider;
}

  OnBoardScreenModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['slider'] != null) {
      _slider = [];
      json['slider'].forEach((v) {
        _slider?.add(NewSlider.fromJson(v));
      });
    }
  }
  bool? _status;
  List<NewSlider>? _slider;
OnBoardScreenModel copyWith({  bool? status,
  List<NewSlider>? slider,
}) => OnBoardScreenModel(  status: status ?? _status,
  slider: slider ?? _slider,
);
  bool? get status => _status;
  List<NewSlider>? get slider => _slider;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_slider != null) {
      map['slider'] = _slider?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 10
/// title : "Trade stocks, smarter. "
/// description : "Having 60+ years of experience, trust us to help you trade safely online. Please provide a USP of your business here in not more than 3 lines."
/// image : "Group.svg"
/// button : null
/// type : "slider"
/// url : null
/// status : 1
/// created_at : null
/// updated_at : null
/// image_url : "http://sauda.wipspace.in/storage/contents/Group.svg"
/// type_text : null

class NewSlider {
  NewSlider({
      num? id, 
      String? title, 
      String? description, 
      String? image, 
      dynamic button, 
      String? type, 
      dynamic url, 
      num? status, 
      dynamic createdAt, 
      dynamic updatedAt, 
      String? imageUrl, 
      dynamic typeText,}){
    _id = id;
    _title = title;
    _description = description;
    _image = image;
    _button = button;
    _type = type;
    _url = url;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _imageUrl = imageUrl;
    _typeText = typeText;
}

  NewSlider.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _image = json['image'];
    _button = json['button'];
    _type = json['type'];
    _url = json['url'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _imageUrl = json['image_url'];
    _typeText = json['type_text'];
  }
  num? _id;
  String? _title;
  String? _description;
  String? _image;
  dynamic _button;
  String? _type;
  dynamic _url;
  num? _status;
  dynamic _createdAt;
  dynamic _updatedAt;
  String? _imageUrl;
  dynamic _typeText;
  NewSlider copyWith({  num? id,
  String? title,
  String? description,
  String? image,
  dynamic button,
  String? type,
  dynamic url,
  num? status,
  dynamic createdAt,
  dynamic updatedAt,
  String? imageUrl,
  dynamic typeText,
}) => NewSlider(  id: id ?? _id,
  title: title ?? _title,
  description: description ?? _description,
  image: image ?? _image,
  button: button ?? _button,
  type: type ?? _type,
  url: url ?? _url,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  imageUrl: imageUrl ?? _imageUrl,
  typeText: typeText ?? _typeText,
);
  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get image => _image;
  dynamic get button => _button;
  String? get type => _type;
  dynamic get url => _url;
  num? get status => _status;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;
  String? get imageUrl => _imageUrl;
  dynamic get typeText => _typeText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['image'] = _image;
    map['button'] = _button;
    map['type'] = _type;
    map['url'] = _url;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['image_url'] = _imageUrl;
    map['type_text'] = _typeText;
    return map;
  }

}