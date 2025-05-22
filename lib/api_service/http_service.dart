import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:synchronized/synchronized.dart';
import '../config/Utils.dart';
import '../config/appurl.dart';
import '../config/const.dart';
import '../config/error_message.dart';

class HttpService {
  late Dio _dio;

  HttpService() {
    init();
  }

  // Add this at the class level
  Completer<String?>? _refreshTokenCompleter;
  final _tokenLock = Lock();

// http get request
  Future getRequest(
    String url, {
    bool isAuthorizationRequired = false,
    bool sendAppDetails = false,
  }) async {
    if (isAuthorizationRequired) {
      String cred = await Utils.getPrefString(AppCredentials);
      var cred1 = jsonDecode(cred);
      Debug.setLog(cred1['accessToken']);

      if (sendAppDetails) {
        // final PackageInfo package_info = await PackageInfo.fromPlatform();
        // _dio.options.headers['client-app-version'] = package_info.version;
        _dio.options.headers['app-type'] = "gymApp";
        // _dio.options.headers['os'] = Platform.operatingSystem;
      }

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['Authorization'] = "${cred1['accessToken']}";
    } else {
      _dio.options.headers['content-Type'] = 'application/json';
    }
    // _dio.options.headers['API-Version'] = AppUrls.api_version;
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}");
      Debug.setLog("url $url");
      response = await _dio.get(url).catchError((e) => throw Exception(e));
      Debug.setLog("response.get ${response.data}");
    } catch (e) {
      Debug.setLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http post request
  Future postRequest(String url,
      {rowData = const {}, bool isAuthorizationRequired = false}) async {
    if (isAuthorizationRequired) {
      String cred = await Utils.getPrefString(AppCredentials);
      var cred1 = jsonDecode(cred);
      Debug.setLog(cred1['accessToken']);

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['Authorization'] = "${cred1['accessToken']}";
    } else {
      _dio.options.headers['content-Type'] = 'application/json';
    }
    // _dio.options.headers['API-Version'] = AppUrls.api_version;
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}");
      Debug.setLog("url $url");
      Debug.setLog("rowData $rowData");
      response = await _dio
          .post(url, data: rowData)
          .catchError((e) => throw Exception(e));
      Debug.setLog("response.post ${response.data}");
    } catch (e) {
      Debug.setLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http post request
  Future uploadMediaRequest(String imagePath,
      {String protection = 'private'}) async {
    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        imagePath,
      ),
      "protection": protection
    });
    String cred = await Utils.getPrefString(AppCredentials);
    var cred1 = jsonDecode(cred);
    Debug.setLog(cred1['accessToken']);

    _dio.options.headers['content-Type'] = "multipart/form-data";
    // _dio.options.headers['API-Version'] = AppUrls.api_version;
    _dio.options.headers['Authorization'] = "${cred1['accessToken']}";
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}");
      response = await _dio.post(AppUrls.upload_media_url, data: data);
      Debug.setLog("response.uploadMedia ${response.data}");
    } catch (e) {
      Debug.setLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http post request
  Future patchRequest(String url,
      {rowData = const {}, bool isAuthorizationRequired = false}) async {
    if (isAuthorizationRequired) {
      String cred = await Utils.getPrefString(AppCredentials);
      var cred1 = jsonDecode(cred);
      Debug.setLog(cred1['accessToken']);

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['Authorization'] = "${cred1['accessToken']}";
    } else {
      _dio.options.headers['content-Type'] = 'application/json';
    }
    // _dio.options.headers['API-Version'] = AppUrls.api_version;
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}");
      Debug.setLog("rowData.patch ${jsonEncode(rowData)}");
      Debug.setLog("url $url");
      response = await _dio.patch(url, data: rowData);
      Debug.setLog("response.patch ${response.data}");
    } catch (e) {
      Debug.setLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http post request
  Future putRequest(String url,
      {rowData = const {}, bool isAuthorizationRequired = false}) async {
    if (isAuthorizationRequired) {
      String cred = await Utils.getPrefString(AppCredentials);
      var cred1 = jsonDecode(cred);
      Debug.setLog(cred1['accessToken']);

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['Authorization'] = "${cred1['accessToken']}";
    } else {
      _dio.options.headers['content-Type'] = 'application/json';
    }
    // _dio.options.headers['API-Version'] = AppUrls.api_version;
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}");
      Debug.setLog("rowData.put ${jsonEncode(rowData)}");
      Debug.setLog("url $url");
      response = await _dio.put(url, data: rowData);
      Debug.setLog("response.put ${response.data}");
    } catch (e) {
      Debug.setLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

// http delete request
  Future deleteRequest(String url,
      {bool isAuthorizationRequired = false}) async {
    if (isAuthorizationRequired) {
      String cred = await Utils.getPrefString(AppCredentials);
      var cred1 = jsonDecode(cred);
      Debug.setLog(cred1['accessToken']);

      _dio.options.headers['content-Type'] = 'application/json';
      _dio.options.headers['Authorization'] = "${cred1['accessToken']}";
    } else {
      _dio.options.headers['content-Type'] = 'application/json';
    }
    // _dio.options.headers['API-Version'] = AppUrls.api_version;
    Response response;
    try {
      Debug.setLog("headers ${_dio.options.headers}");
      Debug.setLog("url $url");
      response = await _dio.delete(url);
      Debug.setLog(response.toString());
    } catch (e) {
      Debug.setLog(e.toString());
      throw Exception(e);
    }

    return response;
  }

  void initializeInterceptors({bool showToast = true}) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (error, handler) async {
          if (kDebugMode) {
            Debug.setLog("statusCode: ${error.response?.statusCode}");
            Debug.setLog("error: ${error.response?.data}");
            Debug.setLog("error type: ${error.type}");
            Debug.setLog("error message: ${error.message}");
          }

          if (error.type == DioExceptionType.receiveTimeout ||
              error.type == DioExceptionType.connectionTimeout) {
            handler.next(
              DioException(
                requestOptions: error.requestOptions,
                error: error,
                message: error.message,
                response: error.response,
                type: error.type,
              ),
            );
            return;
          }

          if (error.response == null) {
            handler.next(
              DioException(
                requestOptions: error.requestOptions,
                error: error,
                message: ErrorMessage.noInternetConnectionMessage,
                response: error.response,
                type: error.type,
              ),
            );
            return;
          }

          switch (error.response?.statusCode) {
            case 400 || 404:
              String message = "";
              final responseData = error.response?.data;
              String? errorCode;

              if ((responseData is Map) &&
                  responseData.containsKey("errorCode") &&
                  responseData["errorCode"] is String) {
                final code = responseData["errorCode"];
              }

              if ((responseData is Map) &&
                  responseData.containsKey("error") &&
                  responseData["error"] is String &&
                  (responseData["error"] as String).isNotEmpty) {
                message = (responseData["error"] as String);
              } else if ((responseData is Map) &&
                  responseData.containsKey("message") &&
                  responseData["message"] is List) {
                message = (responseData["message"] as List).first;
              } else if ((responseData is Map) &&
                  responseData.containsKey("message") &&
                  responseData["message"] is String) {
                message = responseData["message"];
              } else {
                message = error.response?.statusMessage ?? "";
              }
              if (message == "Not Found" || message == "Bad Gateway") {
                // message = ErrorMessage.internalServerErrorHandle;
              }
              if (errorCode == null && showToast) {
                Utils.showSnackBar(
                  message.isNotEmpty
                      ? message
                      : ErrorMessage.somethingWentWrong,
                );
              }

              handler.next(
                DioException(
                  requestOptions: error.requestOptions,
                  error: error,
                  message: errorCode ?? message,
                  response: error.response,
                  type: error.type,
                ),
              );
              break;
            case 500 || 501 || 502:
              String message = "";
              final responseData = error.response?.data;
              String? errorCode;

              if ((responseData is Map) &&
                  responseData.containsKey("errorCode") &&
                  responseData["errorCode"] is String) {
                final code = responseData["errorCode"];
              }

              if ((responseData is Map) &&
                  responseData.containsKey("error") &&
                  responseData["error"] is String &&
                  (responseData["error"] as String).isNotEmpty) {
                message = (responseData["error"] as String);
              } else if ((responseData is Map) &&
                  responseData.containsKey("message") &&
                  responseData["message"] is List) {
                message = (responseData["message"] as List).first;
              } else if ((responseData is Map) &&
                  responseData.containsKey("message") &&
                  responseData["message"] is String) {
                message = responseData["message"];
              } else {
                message = error.response?.statusMessage ?? "";
              }

              handler.next(
                DioException(
                  requestOptions: error.requestOptions,
                  error: error,
                  message: errorCode ?? message,
                  response: error.response,
                  type: error.type,
                ),
              );
              break;
            case 401:
              if (error.response?.data["message"] == "Not authorized") {
                try {

                } catch (e) {
                  Debug.setLog(
                      "Refresh Access Token Failed for ${error.requestOptions.path}: $e");
                }
                return;
              } else {
                String message = error.response?.data["message"];
                if (showToast) {
                  Utils.showSnackBar(
                    message.isNotEmpty
                        ? message
                        : ErrorMessage.somethingWentWrong,
                  );
                }
              }

              handler.next(
                DioException(
                  requestOptions: error.requestOptions,
                  error: error,
                  message: error.response?.data["message"],
                  response: error.response,
                  type: error.type,
                ),
              );
              break;

            case 503:
              String message = error.response?.data["message"];
              if (showToast) {
                Utils.showSnackBar(
                  message.isNotEmpty
                      ? message
                      : ErrorMessage.somethingWentWrong,
                );
              }

              handler.next(
                DioException(
                  requestOptions: error.requestOptions,
                  error: error,
                  message: error.response?.data,
                  response: error.response,
                  type: error.type,
                ),
              );
              break;

            default:
              if (showToast) {
                Utils.showSnackBar(error.response?.data['message']);
              }
              handler.next(
                DioException(
                  requestOptions: error.requestOptions,
                  error: error,
                  message: error.response?.data['message'],
                  response: error.response,
                  type: error.type,
                ),
              );
              break;
          }
        },
      ),
    );
  }

  void init() {
    _dio = Dio(BaseOptions(
        baseUrl: AppUrls.baseUrl,
        followRedirects: false,
        connectTimeout: const Duration(seconds: 120), // 120 seconds
        receiveTimeout: const Duration(seconds: 120)));
    initializeInterceptors();
  }
}
