class BaseSuccessResponse {
  bool? success; // bool
  String? message; // String

  BaseSuccessResponse({this.success, this.message});

  BaseSuccessResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    return data;
  }
}
