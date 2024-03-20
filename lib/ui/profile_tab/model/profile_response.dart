class ProfileResponse {
  dynamic success;
  ProfileData? data;
  dynamic message;

  ProfileResponse({this.success, this.data, this.message});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
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

class ProfileData {
  dynamic id;
  dynamic name;
  dynamic middleName;
  dynamic lastName;
  dynamic email;
  dynamic mobile;
  dynamic stripeAccountId;
  dynamic dob;
  dynamic gender;
  dynamic isOnline;
  dynamic countryCode;
  dynamic otp;
  dynamic token;
  dynamic profile;
  dynamic bio;
  dynamic roleId;
  dynamic businessName;
  dynamic idProof;
  dynamic isVerify;
  dynamic status;
  dynamic isSendNotification;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  dynamic deviceToken;
  dynamic createdAt;
  dynamic updatedAt;

  ProfileData(
      {this.id,
        this.name,
        this.middleName,
        this.lastName,
        this.email,
        this.mobile,
        this.stripeAccountId,
        this.dob,
        this.gender,
        this.isOnline,
        this.countryCode,
        this.otp,
        this.token,
        this.profile,
        this.bio,
        this.roleId,
        this.businessName,
        this.idProof,
        this.isVerify,
        this.status,
        this.isSendNotification,
        this.emailVerifiedAt,
        this.phoneVerifiedAt,
        this.deviceToken,
        this.createdAt,
        this.updatedAt});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    email = json['email'];
    mobile = json['mobile'];
    stripeAccountId = json['stripe_account_id'];
    dob = json['dob'];
    gender = json['gender'];
    isOnline = json['is_online'];
    countryCode = json['country_code'];
    otp = json['otp'];
    token = json['token'];
    profile = json['profile'];
    bio = json['bio'];
    roleId = json['role_id'];
    businessName = json['business_name'];
    idProof = json['id_proof'];
    isVerify = json['is_verify'];
    status = json['status'];
    isSendNotification = json['is_send_notification'];
    emailVerifiedAt = json['email_verified_at'];
    phoneVerifiedAt = json['phone_verified_at'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['middle_name'] = middleName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['stripe_account_id'] = stripeAccountId;
    data['dob'] = dob;
    data['gender'] = gender;
    data['is_online'] = isOnline;
    data['country_code'] = countryCode;
    data['otp'] = otp;
    data['token'] = token;
    data['profile'] = profile;
    data['bio'] = bio;
    data['role_id'] = roleId;
    data['business_name'] = businessName;
    data['id_proof'] = idProof;
    data['is_verify'] = isVerify;
    data['status'] = status;
    data['is_send_notification'] = isSendNotification;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['device_token'] = deviceToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}