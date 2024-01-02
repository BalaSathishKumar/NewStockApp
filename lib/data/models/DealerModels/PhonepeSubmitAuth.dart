class PhonepeAuthModel {
  bool? success;
  String? code;
  String? message;
  Data? data;

  PhonepeAuthModel({this.success, this.code, this.message, this.data});

  PhonepeAuthModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? redirectType;
  String? redirectUrl;

  Data({this.redirectType, this.redirectUrl});

  Data.fromJson(Map<String, dynamic> json) {
    redirectType = json['redirectType'];
    redirectUrl = json['redirectUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['redirectType'] = this.redirectType;
    data['redirectUrl'] = this.redirectUrl;
    return data;
  }
}
