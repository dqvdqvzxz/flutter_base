import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

typedef OnTokenGet = Future<String> Function();
typedef OnResponse = void Function(Response response);
typedef OnError = void Function(DioError error);

abstract class DioService {
  DioService init({
    BaseOptions baseOptions,
    List<Interceptor> interceptors,
    OnTokenGet getTokenMethod,
  });

  void lock();

  void unlock();

  Future<Response<T>> reject<T>(dynamic error);

  void cancelRequest();

  Future<void> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    bool cancelToken,
    ProgressCallback onReceiveProgress,
    @required OnResponse onResponse,
    @required OnError onError,
  });

  Future<void> post<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    @required OnResponse onResponse,
    @required OnError onError,
  });

  Future<void> put<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
    @required OnResponse onResponse,
    @required OnError onError,
  });

  Future<void> delete<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    @required OnResponse onResponse,
    @required OnError onError,
  });

  Future<Response<T>> request<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    CancelToken cancelToken,
    Options options,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  });
}
