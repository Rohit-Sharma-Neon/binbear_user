class CouponListResponse {
  dynamic success;
  List<CouponListData>? data;
  dynamic message;

  CouponListResponse({this.success, this.data, this.message});

  CouponListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <CouponListData>[];
      json['data'].forEach((v) {
        data!.add(CouponListData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class CouponListData {
  dynamic id;
  dynamic title;
  dynamic slug;
  dynamic couponCode;
  dynamic description;
  dynamic image;
  dynamic discount;
  dynamic startDate;
  dynamic endDate;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  CouponListData(
      {this.id,
        this.title,
        this.slug,
        this.couponCode,
        this.description,
        this.image,
        this.discount,
        this.startDate,
        this.endDate,
        this.status,
        this.createdAt,
        this.updatedAt});

  CouponListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    couponCode = json['coupon_code'];
    description = json['description'];
    image = json['image'];
    discount = json['discount'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['coupon_code'] = couponCode;
    data['description'] = description;
    data['image'] = image;
    data['discount'] = discount;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}