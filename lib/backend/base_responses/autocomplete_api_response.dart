class AutoCompleteApiResponse {
  List<AutoCompleteResult>? predictions;
  String? status;

  AutoCompleteApiResponse({this.predictions, this.status});

  AutoCompleteApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['predictions'] != null) {
      predictions = <AutoCompleteResult>[];
      json['predictions'].forEach((v) {
        predictions!.add(AutoCompleteResult.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (predictions != null) {
      data['predictions'] = predictions!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class AutoCompleteResult {
  String? description;
  String? placeId;

  AutoCompleteResult({this.description, this.placeId});

  AutoCompleteResult.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    placeId = json['place_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['place_id'] = placeId;
    return data;
  }
}
