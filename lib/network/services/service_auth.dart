import 'dart:io';

import 'package:dio/dio.dart';
import 'package:blocloginflow/network/services/service_interface.dart';
import 'package:meta/meta.dart';

class DioServiceAuth implements DioService {
  static final DioServiceAuth _instance = DioServiceAuth._internal();

  Dio _client;
  CancelToken _cancelToken;
  String _authenticationSchema;
  OnTokenGet _getTokenMethod;

  DioServiceAuth._internal() {
    this._client = Dio();
    _cancelToken = CancelToken();
  }

  factory DioServiceAuth() => _instance;

  @override
  DioService init({
    BaseOptions baseOptions,
    List<Interceptor> interceptors,
    @required String authenticationSchema,
    @required OnTokenGet getTokenMethod,
  }) {
    _authenticationSchema = authenticationSchema;
    _getTokenMethod = getTokenMethod;
    _client.options = baseOptions;
    _client.interceptors.clear();
    if (interceptors != null && interceptors.isNotEmpty)
      _client.interceptors.addAll(interceptors);

    return _instance;
  }

  @override
  Future<void> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    bool cancelToken,
    ProgressCallback onReceiveProgress,
    OnResponse onResponse,
    OnError onError,
  }) async {
    print('Call me A');
    try {
      var authOption = options ?? Options();
      authOption.headers[HttpHeaders.authorizationHeader] =
          '$_authenticationSchema ${await _getTokenMethod()}';
      var response = await _client.get(path,
          queryParameters: queryParameters,
          options: options ?? authOption,
          onReceiveProgress: onReceiveProgress,
          cancelToken: cancelToken ?? _cancelToken);

      if (onResponse != null) onResponse(response);
    } on DioError catch (error) {
      if (onError != null)
        _handleError(error);
    }
  }

  @override
  Future<void> post<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    OnResponse onResponse,
    OnError onError,
  }) async {
    try {
      var authOption = options ?? Options();
      authOption.headers[HttpHeaders.authorizationHeader] =
          '$_authenticationSchema ${await _getTokenMethod()}';
      var response = await _client.post(
        path,
        queryParameters: queryParameters,
        options: authOption,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        data: data,
        cancelToken: cancelToken ?? _cancelToken,
      );

      if (onResponse != null) onResponse(response);
    } on DioError catch (error) {
      if (onError != null)
        _handleError(error);
    }
  }

  @override
  Future<void> put<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    OnResponse onResponse,
    OnError onError,
  }) async {
    try {
      var authOption = options ?? Options();
      authOption.headers[HttpHeaders.authorizationHeader] =
          '$_authenticationSchema ${await _getTokenMethod()}';
      var response = await _client.put(
        path,
        queryParameters: queryParameters,
        options: authOption,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        data: data,
        cancelToken: cancelToken ?? _cancelToken,
      );

      if (onResponse != null) onResponse(response);
    } on DioError catch (error) {
      if (onError != null)
        _handleError(error);
    }
  }

  @override
  Future<void> delete<T>(String path,
      {data,
      Map<String, dynamic> queryParameters,
      Options options,
      CancelToken cancelToken,
      OnResponse onResponse,
      OnError onError}) async {
    try {
      var authOption = options ?? Options();
      authOption.headers[HttpHeaders.authorizationHeader] =
          '$_authenticationSchema ${await _getTokenMethod()}';
      var response = await _client.delete(
        path,
        queryParameters: queryParameters,
        options: authOption,
        data: data,
        cancelToken: cancelToken ?? _cancelToken,
      );
      if (onResponse != null) onResponse(response);
    } on DioError catch (error) {
      if (onError != null)
        _handleError(error);
    }
  }

  @override
  Future<Response<T>> request<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
    onSendProgress,
    onReceiveProgress,
  }) {
    return _client.request(
      path,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken ?? _cancelToken,
      options: options,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  @override
  Future<Response<T>> reject<T>(dynamic error) {
    return _client.reject(error);
  }

  @override
  void cancelRequest() {
    _cancelToken.cancel('cancel');
  }

  @override
  void lock() {
    _client.lock();
    _client.interceptors.responseLock.lock();
    _client.interceptors.errorLock.lock();
  }

  @override
  void unlock() {
    _client.unlock();
    _client.interceptors.responseLock.unlock();
    _client.interceptors.errorLock.unlock();
  }

  String _handleError(DioError error) {
    String errorDescription = "";
    switch (error.type) {
      case DioErrorType.CANCEL:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.RESPONSE:
        errorDescription =
            "Received invalid status code: ${error.response.statusCode}";
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = "Send timeout in connection with API server";
        break;
      case DioErrorType.DEFAULT:
        errorDescription =
        "Connection to API server failed due to internet connection";
        break;
    }
    return errorDescription;
  }
}
