import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {

  JsonEncoder encoder = new JsonEncoder.withIndent('  ');

  @override
  Future onRequest(RequestOptions request) async {
    log('''
        \n-----------------------------------------------------------------------------------------------------
        HTTPService------onRequest:
        Method: ${request.method.toUpperCase()}
        URL: ${request.uri.toString()}
        Header: ${request.queryParameters[HttpHeaders.requestHeaders]}
        Content-Type: ${request.contentType},
        Body: ${request.data},
-----------------------------------------------------------------------------------------------------
        ''');
    return request;
  }

  @override
  Future onResponse(Response response) async {
    log(
        '''
        \n-----------------------------------------------------------------------------------------------------
        HttpService------onResponse:
        Method: ${response.request.method.toUpperCase()}
        URL: ${response.request.uri.toString()}
        StatusCode: ${response.statusCode}
        RepsonseData: ${encoder.convert(response.data)}
-----------------------------------------------------------------------------------------------------
        ''');

    return response;
  }

  @override
  Future onError(DioError error) async {
    log(
    '''
        \n-----------------------------------------------------------------------------------------------------
        HttpService------onError:
        Method: ${error.request.method.toUpperCase()}
        URL: ${error.request.uri.toString()}
        StatusCode: ${error.response.statusCode}
        Message: ${error.message}
-----------------------------------------------------------------------------------------------------
        ''');
    return error;
  }
}
