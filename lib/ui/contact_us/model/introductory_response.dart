class IntroductoryResponse {
  dynamic success;
  List<IntroductoryData>? data;
  dynamic message;

  IntroductoryResponse({this.success, this.data, this.message});

  IntroductoryResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <IntroductoryData>[];
      json['data'].forEach((v) {
        data!.add(IntroductoryData.fromJson(v));
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

class IntroductoryData {
  dynamic title;
  dynamic file;

  IntroductoryData({this.title, this.file});

  IntroductoryData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['file'] = file;
    return data;
  }
}