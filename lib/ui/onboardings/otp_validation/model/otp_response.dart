class OtpResponse {
  bool? success;
  Data? data;
  String? message;

  OtpResponse({this.success, this.data, this.message});

  OtpResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  dynamic token;
  dynamic name;
  dynamic profile;

  Data({this.token, this.name, this.profile});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    name = json['name'];
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['name'] = name;
    data['profile'] = profile;
    return data;
  }
}