class CheckoutResponseModel {
  bool? status;
  String? message;
  Data? data;

  CheckoutResponseModel({this.status, this.message, this.data});

  CheckoutResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? subtotal;
  String? couponCode;
  String? discountAmount;
  String? total;
  String? planId;

  Data(
      {this.subtotal,
        this.couponCode,
        this.discountAmount,
        this.total,
        this.planId});

  Data.fromJson(Map<String, dynamic> json) {
    subtotal = json['subtotal'];
    couponCode = json['coupon_code'];
    discountAmount = json['discount_amount'];
    total = json['total'];
    planId = json['plan_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subtotal'] = this.subtotal;
    data['coupon_code'] = this.couponCode;
    data['discount_amount'] = this.discountAmount;
    data['total'] = this.total;
    data['plan_id'] = this.planId;
    return data;
  }
}
