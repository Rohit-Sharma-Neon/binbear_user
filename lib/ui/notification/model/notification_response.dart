class NotificationListResponse {
  dynamic success;
  List<NotificationListData>? data;
  dynamic message;

  NotificationListResponse({this.success, this.data, this.message});

  NotificationListResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <NotificationListData>[];
      json['data'].forEach((v) {
        data!.add(NotificationListData.fromJson(v));
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

class NotificationListData {
  dynamic id;
  dynamic title;
  dynamic message;
  dynamic isRead;
  dynamic createdAt;
  List<Users>? users;

  NotificationListData(
      {this.id,
        this.title,
        this.message,
        this.isRead,
        this.createdAt,
        this.users});

  NotificationListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['message'] = message;
    data['is_read'] = isRead;
    data['created_at'] = createdAt;
    if (users != null) {
      data['users'] = users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  dynamic profile;

  Users({this.profile});

  Users.fromJson(Map<String, dynamic> json) {
    profile = json['profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profile'] = profile;
    return data;
  }
}