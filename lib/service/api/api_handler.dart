import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import '../../app/core/config/app_constant.dart';
import 'base_error.dart';
import 'base_response.dart';
import 'base_url_config.dart';

/// we have added one object of this class in Dependency Injection
/// so kindly do use it (Don't create another one as its not needed)
/// use Get.find(tag : (ApiHandler).toString()) to access it

class ApiHandler extends GetxService {
  Dio? _dio;
  String tag = "API call :";
  CancelToken? _cancelToken;

  static final ApiHandler _instance = ApiHandler._internal();

  factory ApiHandler({bool isJson = false}) {
// mDio.options.headers['authorization'] = 'Bearer ';
// mDio.options.contentType = !isJson
// ? 'application/json'
// : 'application/x-www-form-urlencoded';

    return _instance;
  }

  ApiHandler._internal() {
    _dio = initApiHandlerDio();
  }

  Dio initApiHandlerDio() {
    _cancelToken = CancelToken();
    final baseOption = BaseOptions(
      connectTimeout: 10 * 1000,
      receiveTimeout: 10 * 1000,
      baseUrl: apiBaseUrl,
      contentType: 'application/json',
      headers: {
        'Authorization': 'Bearer ',
      },
    );
    final mDio = Dio(baseOption);
    if(kDebugMode){
      mDio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true, error: true));
    }
    mDio.interceptors.add(HttpHandleInterceptor());
    return mDio;
  }

  void cancelRequests({CancelToken? cancelToken}) {
    cancelToken == null
        ? _cancelToken?.cancel('Cancelled')
        : cancelToken.cancel();
  }

  Future<BaseResponse?> get(
    String endUrl, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var isConnected = await _checkInternet();
      if (!isConnected) {
        return BaseResponse.failure(ErrorResult(
            errorMessage: AppConstant.internetNotConnected,
            type: ErrorType.noInternetConnection));
      }
      final response = await (_dio?.get(
        endUrl,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
      ));
      return _responseHandler(response);
    } on FormatException {
      return BaseResponse.failure(ErrorResult(errorMessage: "Bad Response Format",type: ErrorType.other));
    } on DioError catch (e) {
      return _errorHandler(e);
    }
  }

  Future<BaseResponse?> post(
    String endUrl, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
    bool isMultipartFormData = false,
  }) async {
    try {
      var isConnected = await _checkInternet();
      if (!isConnected) {
        return BaseResponse.failure(ErrorResult(
            errorMessage: AppConstant.internetNotConnected,
            type: ErrorType.noInternetConnection));
      }

      final response = await (_dio?.post(
        endUrl,
        data: isMultipartFormData ? FormData.fromMap(data!) : data,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
      ));
      return _responseHandler(response);
    } on FormatException {
      return BaseResponse.failure(ErrorResult(errorMessage: "Bad Response Format",type: ErrorType.other));
    } on DioError catch (e) {
      return _errorHandler(e);
    }
  }

  Future<BaseResponse?> delete(
    String endUrl, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var isConnected = await _checkInternet();
      if (!isConnected) {
        return BaseResponse.failure(ErrorResult(
            errorMessage: AppConstant.internetNotConnected,
            type: ErrorType.noInternetConnection));
      }
      final response = await (_dio?.delete(
        endUrl,
        data: data,
        queryParameters: params,
        cancelToken: cancelToken ?? _cancelToken,
        options: options,
      ));
      return _responseHandler(response);
    } on FormatException {
      return BaseResponse.failure(ErrorResult(errorMessage: "Bad Response Format",type: ErrorType.other));
    } on DioError catch (e) {
      return _errorHandler(e);
    }
  }

  BaseResponse _responseHandler(Response<dynamic>? response){
    if (response?.statusCode == 200) {
      return BaseResponse.success(response);
    } else if (response?.statusCode == 401) {
      return BaseResponse.failure(ErrorResult(errorMessage:AppConstant
          .unauthorized,type: ErrorType.other));
    } else if (response?.statusCode == 500) {
      return BaseResponse.failure(ErrorResult(errorMessage:AppConstant.serverNotRespond,type: ErrorType.serverNotRespond));
    } else {
      return BaseResponse.failure(ErrorResult(errorMessage:AppConstant
          .somethingWentWrong,type: ErrorType
          .other));
    }
  }

  BaseResponse _errorHandler(DioError error) {
    if (error.type == DioErrorType.response) {
      return BaseResponse.success(error.response?.data);
    }
    return BaseResponse.failure(ErrorResult.getErrorResult(error));
  }

  Future<bool> _checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}

/// you can use this interceptor to change headers, url, requests and responses at runtime
class HttpHandleInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {

    /// demo of how can we update header and base url at runtime

    // if (options.path.contains(Apis.login)) {
    //   options.baseUrl = "https://brainvire.com/V2/";
    //
    //   options.headers = {
    //     'ClientId': "C139304",
    //     'Authorization':
    //     'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJjbGllbnRfaWQiOjE2NSwidXNlcl9pbmZvIjoxLCJpYXQiOjE2MjQ5NzA1NzYsImV4cCI6MTk0MDU0NjU3NiwiYXVkIjoiYXBpLnNhbS5pbmZlZWRvLmNvbSJ9.x2rt5AX4d6HjajHD09ql3NxHFJUkH4cEnEEhm1XMh31clJnLPRPdtpJEnsME1FF2ZrfA7flMHTtrXhIY0oAvZg'
    //   };
    // }
    handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
