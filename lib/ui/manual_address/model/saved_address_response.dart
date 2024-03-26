class SavedAddressListResponse {
  dynamic success;
  List<SavedAddressListData>? data;
  dynamic message;

  SavedAddressListResponse({this.success, this.data, this.message});

  SavedAddressListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <SavedAddressListData>[];
      json['data'].forEach((v) {
        data!.add(SavedAddressListData.fromJson(v));
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

class SavedAddressListData {
  dynamic id;
  dynamic userId;
  dynamic flatNo;
  dynamic apartment;
  dynamic description;
  dynamic lat;
  dynamic lng;
  dynamic homeType;
  dynamic fullAddress;
  dynamic isDeleted;
  dynamic isDefault;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  SavedAddressListData(
      {this.id,
        this.userId,
        this.flatNo,
        this.apartment,
        this.description,
        this.lat,
        this.lng,
        this.homeType,
        this.fullAddress,
        this.isDeleted,
        this.isDefault,
        this.status,
        this.createdAt,
        this.updatedAt});

  SavedAddressListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    flatNo = json['flat_no'];
    apartment = json['apartment'];
    description = json['description'];
    lat = json['lat'];
    lng = json['lng'];
    homeType = json['home_type'];
    fullAddress = json['full_address'];
    isDeleted = json['is_deleted'];
    isDefault = json['is_default'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['flat_no'] = flatNo;
    data['apartment'] = apartment;
    data['description'] = description;
    data['lat'] = lat;
    data['lng'] = lng;
    data['home_type'] = homeType;
    data['full_address'] = fullAddress;
    data['is_deleted'] = isDeleted;
    data['is_default'] = isDefault;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}