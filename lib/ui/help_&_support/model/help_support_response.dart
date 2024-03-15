class HelpSupportResponse {
  dynamic success;
  List<HelpSupportData>? data;
  dynamic message;

  HelpSupportResponse({this.success, this.data, this.message});

  HelpSupportResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <HelpSupportData>[];
      json['data'].forEach((v) {
        data!.add(HelpSupportData.fromJson(v));
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

class HelpSupportData {
  dynamic question;
  dynamic answer;

  HelpSupportData({this.question, this.answer});

  HelpSupportData.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['answer'] = answer;
    return data;
  }
}
