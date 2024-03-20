class HomeResponse {
  dynamic success;
  HomeData? data;
  dynamic message;

  HomeResponse({this.success, this.data, this.message});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? HomeData.fromJson(json['data']) : null;
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

class HomeData {
  List<Userdetail>? userdetail;
  List<HomeBanners>? banners;
  List<HomeServices>? services;
  List<HomeBookings>? bookings;

  HomeData({this.userdetail, this.banners, this.services, this.bookings});

  HomeData.fromJson(Map<String, dynamic> json) {
    if (json['Userdetail'] != null) {
      userdetail = <Userdetail>[];
      json['Userdetail'].forEach((v) {
        userdetail!.add(Userdetail.fromJson(v));
      });
    }
    if (json['Banners'] != null) {
      banners = <HomeBanners>[];
      json['Banners'].forEach((v) {
        banners!.add(HomeBanners.fromJson(v));
      });
    }
    if (json['services'] != null) {
      services = <HomeServices>[];
      json['services'].forEach((v) {
        services!.add(HomeServices.fromJson(v));
      });
    }
    if (json['bookings'] != null) {
      bookings = <HomeBookings>[];
      json['bookings'].forEach((v) {
        bookings!.add(HomeBookings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userdetail != null) {
      data['Userdetail'] = userdetail!.map((v) => v.toJson()).toList();
    }
    if (banners != null) {
      data['Banners'] = banners!.map((v) => v.toJson()).toList();
    }
    if (services != null) {
      data['services'] = services!.map((v) => v.toJson()).toList();
    }
    if (bookings != null) {
      data['bookings'] = bookings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Userdetail {
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
  dynamic serviceProviderId;
  dynamic businessName;
  dynamic idProof;
  dynamic isVerify;
  dynamic adminApproval;
  dynamic status;
  dynamic isSendNotification;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  dynamic deviceToken;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic useraddress;

  Userdetail(
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
        this.serviceProviderId,
        this.businessName,
        this.idProof,
        this.isVerify,
        this.adminApproval,
        this.status,
        this.isSendNotification,
        this.emailVerifiedAt,
        this.phoneVerifiedAt,
        this.deviceToken,
        this.createdAt,
        this.updatedAt,
        this.useraddress});

  Userdetail.fromJson(Map<String, dynamic> json) {
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
    serviceProviderId = json['service_provider_id'];
    businessName = json['business_name'];
    idProof = json['id_proof'];
    isVerify = json['is_verify'];
    adminApproval = json['admin_approval'];
    status = json['status'];
    isSendNotification = json['is_send_notification'];
    emailVerifiedAt = json['email_verified_at'];
    phoneVerifiedAt = json['phone_verified_at'];
    deviceToken = json['device_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    useraddress = json['useraddress'];
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
    data['service_provider_id'] = serviceProviderId;
    data['business_name'] = businessName;
    data['id_proof'] = idProof;
    data['is_verify'] = isVerify;
    data['admin_approval'] = adminApproval;
    data['status'] = status;
    data['is_send_notification'] = isSendNotification;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['device_token'] = deviceToken;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['useraddress'] = useraddress;
    return data;
  }
}

class HomeBanners {
  dynamic id;
  dynamic title;
  dynamic slug;
  dynamic description;
  dynamic shortDescription;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic image;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  HomeBanners(
      {this.id,
        this.title,
        this.slug,
        this.description,
        this.shortDescription,
        this.metaTitle,
        this.metaDescription,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  HomeBanners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    shortDescription = json['short_description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['short_description'] = shortDescription;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class HomeServices {
  dynamic id;
  dynamic title;
  dynamic description;
  dynamic price;
  dynamic image;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  HomeServices(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  HomeServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class HomeBookings {
  dynamic id;
  dynamic assignedProvider;
  dynamic assignedDriver;
  dynamic userId;
  dynamic categoryId;
  dynamic subCategoryId;
  dynamic noOfCane;
  dynamic price;
  dynamic status;
  dynamic serviceStatus;
  dynamic createdAt;
  dynamic updatedAt;
  SubCategoryData? subCategoryData;
  CategoryData? categoryData;
  dynamic binbearData;
  dynamic serviceProviderData;
  UserData? userData;

  HomeBookings(
      {this.id,
        this.assignedProvider,
        this.assignedDriver,
        this.userId,
        this.categoryId,
        this.subCategoryId,
        this.noOfCane,
        this.price,
        this.status,
        this.serviceStatus,
        this.createdAt,
        this.updatedAt,
        this.subCategoryData,
        this.categoryData,
        this.binbearData,
        this.serviceProviderData,
        this.userData});

  HomeBookings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assignedProvider = json['assigned_provider'];
    assignedDriver = json['assigned_driver'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    noOfCane = json['no_of_cane'];
    price = json['price'];
    status = json['status'];
    serviceStatus = json['service_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subCategoryData = json['sub_category_data'] != null
        ? SubCategoryData.fromJson(json['sub_category_data'])
        : null;
    categoryData = json['category_data'] != null
        ? CategoryData.fromJson(json['category_data'])
        : null;
    binbearData = json['binbear_data'];
    serviceProviderData = json['service_provider_data'];
    userData = json['user_data'] != null
        ? UserData.fromJson(json['user_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['assigned_provider'] = assignedProvider;
    data['assigned_driver'] = assignedDriver;
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['no_of_cane'] = noOfCane;
    data['price'] = price;
    data['status'] = status;
    data['service_status'] = serviceStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (subCategoryData != null) {
      data['sub_category_data'] = subCategoryData!.toJson();
    }
    if (categoryData != null) {
      data['category_data'] = categoryData!.toJson();
    }
    data['binbear_data'] = binbearData;
    data['service_provider_data'] = serviceProviderData;
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    return data;
  }
}

class SubCategoryData {
  dynamic id;
  dynamic categoryId;
  dynamic title;
  dynamic price;
  dynamic description;
  dynamic image;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  SubCategoryData(
      {this.id,
        this.categoryId,
        this.title,
        this.price,
        this.description,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  SubCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class CategoryData {
  dynamic id;
  dynamic title;
  dynamic description;
  dynamic price;
  dynamic image;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

  CategoryData(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  CategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['price'] = price;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class UserData {
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
  dynamic serviceProviderId;
  dynamic businessName;
  dynamic idProof;
  dynamic isVerify;
  dynamic adminApproval;
  dynamic status;
  dynamic isSendNotification;
  dynamic emailVerifiedAt;
  dynamic phoneVerifiedAt;
  dynamic deviceToken;
  dynamic createdAt;
  dynamic updatedAt;

  UserData(
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
        this.serviceProviderId,
        this.businessName,
        this.idProof,
        this.isVerify,
        this.adminApproval,
        this.status,
        this.isSendNotification,
        this.emailVerifiedAt,
        this.phoneVerifiedAt,
        this.deviceToken,
        this.createdAt,
        this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
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
    serviceProviderId = json['service_provider_id'];
    businessName = json['business_name'];
    idProof = json['id_proof'];
    isVerify = json['is_verify'];
    adminApproval = json['admin_approval'];
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
    data['service_provider_id'] = serviceProviderId;
    data['business_name'] = businessName;
    data['id_proof'] = idProof;
    data['is_verify'] = isVerify;
    data['admin_approval'] = adminApproval;
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
