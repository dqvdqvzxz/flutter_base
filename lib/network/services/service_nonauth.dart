import 'package:blocloginflow/network/services/service_error.dart';
import 'package:dio/dio.dart';
import 'package:blocloginflow/network/services/service_interface.dart';

class DioServiceNonAuth implements DioService {
  static final DioServiceNonAuth _instance = DioServiceNonAuth._internal();

  Dio _client;
  CancelToken _cancelToken;

  DioServiceNonAuth._internal() {
    this._client = Dio();
    _cancelToken = CancelToken();
  }

  factory DioServiceNonAuth() => _instance;

  @override
  DioService init({
    BaseOptions baseOptions,
    List<Interceptor> interceptors,
    OnTokenGet getTokenMethod,
  }) {
    _client.options = baseOptions;
    if (interceptors != null && interceptors.isNotEmpty) {
      _client.interceptors.clear();
      _client.interceptors.addAll(interceptors);
    }

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
    try {
      var response = await _client.get(path,
          queryParameters: queryParameters,
          options: options,
          onReceiveProgress: onReceiveProgress,
          cancelToken: cancelToken ?? _cancelToken);

      if (onResponse != null)
        onResponse(response);
    } on DioError catch (error) {
      if (onError != null)
        HandleError(error);
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
      var response = await _client.post(
        path,
        queryParameters: queryParameters,
        options: options,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        data: data,
        cancelToken: cancelToken ?? _cancelToken,
      );

      if (onResponse != null)
        onResponse(response);
    } on DioError catch (error) {
      if (onError != null)
        HandleError(error);
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
      var response = await _client.put(
        path,
        queryParameters: queryParameters,
        options: options,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        data: data,
        cancelToken: cancelToken ?? _cancelToken,
      );

      if (onResponse != null)
        onResponse(response);
    } on DioError catch (error) {
      if (onError != null)
        HandleError(error);
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
      var response = await _client.delete(
        path,
        queryParameters: queryParameters,
        options: options,
        data: data,
        cancelToken: cancelToken ?? _cancelToken,
      );
      if (onResponse != null)
        onResponse(response);
    } on DioError catch (error) {
      if (onError != null)
        HandleError(error);
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
}
