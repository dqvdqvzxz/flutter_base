import 'dart:io';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor{
  @override
  Future onRequest(RequestOptions request) async{
    print(
        'HttpService------onRequest:\x1B[94m ${request.method.toUpperCase()} \x1B[94m ${request.uri.toString()} ---------------\nHttpService------Authorization: \x1B[94m ${request.headers[HttpHeaders.authorizationHeader]}---------------------------------');
    return request;
  }

  @override
  Future onResponse(Response response) async{
    print(
        'HttpService------onRespond:\x1b[32m ${response.request.method.toUpperCase()} ${response.request.uri.toString()} \nHttpService------Status: \x1b[32m ${response.statusCode}');
    return response;
  }

  @override
  Future onError(DioError error) async {
    print(
        'HttpService------onError:\x1b[35m ${error.request.method.toUpperCase()} \x1b[35m ${error.request.uri.toString()} \nHttpService------Status: \x1b[35m ${error.response.statusCode}\nHttpService------Message:\x1b[35m ${error.message}');
    return error;
  }
}