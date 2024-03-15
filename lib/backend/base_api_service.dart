import 'dart:developer';
import 'dart:io';
import 'package:binbear/backend/api_end_points.dart';
import 'package:binbear/utils/base_functions.dart';
import 'package:binbear/utils/base_variables.dart';
import 'package:binbear/utils/storage_keys.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class BaseApiService {
  late Dio _dio;
  GetStorage getStorage = GetStorage();
  static final BaseApiService _singleton = BaseApiService._internal();

  factory BaseApiService() {
    return _singleton;
  }

  BaseApiService._internal() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: apiTimeOut),
        receiveTimeout: const Duration(seconds: apiTimeOut),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          "Authorization": "Bearer ${getStorage.read(StorageKeys.apiToken)}",
        },
      ),
    );
    _dio.interceptors.add(LogInterceptor(
      request: false,
      requestHeader: false,
      requestBody: false,
      responseHeader: false,
      responseBody: true,
      error: true,
    ));
    _dio.interceptors.add(CurlLoggerDioInterceptor(printOnSuccess: true, convertFormData: true));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        FocusManager.instance.primaryFocus?.unfocus();
        if (await checkInternetConnection()) {
          return handler.next(options);
        } else {
          dismissBaseLoader();
          return handler.reject(DioException(
            error: 'No Internet Connection',
            requestOptions: options,
            type: DioExceptionType.connectionError,
          ));
        }
      },
    ));
  }



  /// GET Method
  Future<Response?> get({required String apiEndPoint, Map<String, dynamic>? queryParameters,bool? showLoader,bool? showErrorSnackbar}) async {
    showBaseLoader(showLoader: showLoader??true);
    try {
      final Response response = await _dio.get(ApiEndPoints().baseUrl+apiEndPoint, queryParameters: queryParameters);
      dismissBaseLoader(showLoader: showLoader??true);
      return response;
    } on DioException catch (e) {
      dismissBaseLoader(showLoader: showLoader??true);
      if (e.error.toString() == "No Internet Connection") {
        showSnackBar(subtitle: e.error.toString());
      }
      _handleError(e,showErrorSnackbar: showErrorSnackbar??true);
      rethrow;
    }
  }

  /// POST Method
  Future<Response?> post({required String apiEndPoint, dynamic data, Map<String, dynamic>? headers, bool? showLoader}) async {
    showBaseLoader(showLoader: showLoader??true);
    try {
        final Response response = await _dio.post(ApiEndPoints().baseUrl+apiEndPoint, data: data);
        dismissBaseLoader(showLoader: showLoader??true);
        return response;
      } on DioException catch (e) {
      dismissBaseLoader(showLoader: showLoader??true);
      if (e.error.toString() == "No Internet Connection") {
        showSnackBar(subtitle: e.error.toString());
      }
      _handleError(e);
      rethrow;
      }
  }

  /// PUT Method
  Future<Response?> put({required String apiEndPoint, dynamic data, Map<String, dynamic>? headers, bool? showLoader}) async {
    showBaseLoader(showLoader: showLoader??true);
    try {
      final Response response = await _dio.put(ApiEndPoints().baseUrl+apiEndPoint, data: data);
      dismissBaseLoader(showLoader: showLoader??true);
      return response;
    } on DioException catch (e) {
      dismissBaseLoader(showLoader: showLoader??true);
      _handleError(e);
      rethrow;
    }
  }

  // /// PATCH Method
  // Future<Response?> patch({required String url, dynamic data, Map<String, dynamic>? headers, bool? concatUserId}) async {
  //   if (await checkInternetConnection()) {
  //     try {
  //       BaseOverlays().showLoader();
  //       languageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
  //       String currentBaseURL = await BaseSharedPreference().getString(SpKeys().currentBaseURL)??ApiEndPoints().concatBaseUrl2;
  //       FocusScope.of(X.Get.context!).requestFocus(FocusNode());
  //       final String token = await BaseSharedPreference().getString(SpKeys().apiToken)??"";
  //       final String userId = await BaseSharedPreference().getString(SpKeys().userId)??"";
  //       final response = await _dio.patch((currentBaseURL+url)+((concatUserId??false) ? userId : ""), data: data, options: Options(headers: headers??{"Authorization": "Bearer $token","Accept-Language":languageCode}));
  //       BaseOverlays().dismissOverlay();
  //       return response;
  //     } on DioException catch (e) {
  //       BaseOverlays().dismissOverlay();
  //       _handleError(e);
  //       rethrow;
  //     }
  //   }else{
  //     // BaseDialogs().dismissLoader();
  //     BaseOverlays().showSnackBar(message: translate(X.Get.context!).no_internet_connection);
  //     return null;
  //   }
  // }
  //
  // /// Delete Method
  // Future<Response?> delete({required String url, Map<String, dynamic>? headers, dynamic data}) async {
  //   FocusScope.of(X.Get.context!).requestFocus(FocusNode());
  //   if (await checkInternetConnection()) {
  //     try {
  //       BaseOverlays().showLoader();
  //       languageCode = await BaseSharedPreference().getString(SpKeys().selectedLanguage);
  //       String currentBaseURL = await BaseSharedPreference().getString(SpKeys().currentBaseURL)??ApiEndPoints().concatBaseUrl2;
  //       final String token = await BaseSharedPreference().getString(SpKeys().apiToken);
  //       final response = await _dio.delete(currentBaseURL+url, data: data, options: Options(headers: headers??{"Authorization": "Bearer $token","Accept-Language":languageCode}));
  //       BaseOverlays().dismissOverlay();
  //       return response;
  //     } on DioException catch (e) {
  //       BaseOverlays().dismissOverlay();
  //       _handleError(e);
  //       rethrow;
  //     }
  //   }else{
  //     // BaseDialogs().dismissLoader();
  //     BaseOverlays().showSnackBar(message: translate(X.Get.context!).no_internet_connection);
  //     return null;
  //   }
  // }

  /// Check Internet Connection
  Future<bool> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }else{
        showSnackBar(subtitle: "No Internet Connection");
        log("No internet connection");
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  // Future<Response> postFormData(String url, Map<String, dynamic> formData, String type, {Map<String, dynamic>? headers, bool? showLoader}) async {
  //   BaseOverlays().showLoader(showLoader: showLoader);
  //   FocusScope.of(X.Get.context!).requestFocus(FocusNode());
  //   try {
  //     final String token = await BaseSharedPreference().getString(SpKeys().apiToken) ?? "";
  //     String currentBaseURL = await BaseSharedPreference().getString(SpKeys().currentBaseURL)??ApiEndPoints().concatBaseUrl2;
  //     var response;
  //     if (type == "post") {
  //       response = await _dio.post(currentBaseURL+url, data: FormData.fromMap(formData), options: Options(headers: headers ?? {"Authorization": "Bearer $token", "Accept-Language":languageCode}));
  //     }
  //     if (type == "patch") {
  //       response = await _dio.patch(currentBaseURL+url, data: FormData.fromMap(formData), options: Options(headers: headers ?? {"Authorization": "Bearer $token", "Accept-Language":languageCode}));
  //     }
  //     if (type == "put") {
  //       response = await _dio.put(currentBaseURL+url, data: FormData.fromMap(formData), options: Options(headers: headers ?? {"Authorization": "Bearer $token", "Accept-Language":languageCode}));
  //     }
  //     // BaseOverlays().dismissOverlay(showLoader: showLoader);
  //     X.Get.back();
  //     return response;
  //   } on DioException catch (e) {
  //     X.Get.back();
  //     // BaseOverlays().dismissOverlay(showLoader: showLoader);
  //     _handleError(e);
  //     rethrow;
  //   }
  // }
  //
  // Future<Response> uploadFile(File file, String url, {Function(int, int)? onSendProgress}) async {
  //   try {
  //     String currentBaseURL = await BaseSharedPreference().getString(SpKeys().currentBaseURL)??ApiEndPoints().concatBaseUrl2;
  //     final formData = FormData.fromMap({
  //       "file": await MultipartFile.fromFile(file.path),
  //     });
  //     final response = await _dio.post(
  //       currentBaseURL+url,
  //       data: formData,
  //       options: Options(
  //         headers: {
  //           HttpHeaders.contentTypeHeader: "multipart/form-data",
  //         },
  //       ),
  //       onSendProgress: onSendProgress,
  //     );
  //     return response;
  //   } on DioException catch (e) {
  //     _handleError(e);
  //     rethrow;
  //   }
  // }

  void _handleError(DioException e,{bool? showErrorSnackbar}) {
    if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
      // Handle timeout error
      log('Timeout Error: ${e.message}');
    } else if (e.type == DioExceptionType.unknown) {
      // Handle response error
      log('Bad Response Error: ${e.message}');
      if (showErrorSnackbar??true) {
        showSnackBar(subtitle: (e.response?.data['message']??"")??"");
      }
    } else if (e.type == DioExceptionType.cancel) {
      // Handle cancel error
      log('Request Cancelled Error: ${e.message}');
    } else {
      // Handle other errors
      log('Unknown Error: ${e.response?.data["message"]}');
      if ((e.response?.data["message"].toString()??"").isNotEmpty) {
        if (showErrorSnackbar??true) {
          showSnackBar(subtitle: e.response?.data["message"]);
        }
      }
    }
  }

}
