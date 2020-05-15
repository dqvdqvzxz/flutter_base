import 'package:blocloginflow/network/intercepter/logging_intercepter.dart';
import 'package:blocloginflow/network/services/service_auth.dart';
import 'package:blocloginflow/network/services/service_interface.dart';
import 'package:dio/dio.dart';

class HttpServices{
  DioService authService;

  static final HttpServices _instance = HttpServices.internal();

  HttpServices.internal();

  factory HttpServices(){
    return _instance;
  }

  BaseOptions _baseOptions = BaseOptions(
    baseUrl: 'https://randomuser.me/api/',
    receiveTimeout: 30000,
    connectTimeout: 30000,
    sendTimeout: 30000,
    responseType: ResponseType.json
  );

  void initHttpRequest() async {
    var tokenStorage = 'token';
    DioServiceAuth().init(
      baseOptions: _baseOptions,
      interceptors: [
        LoggingInterceptor(),
      ],
      authenticationSchema: '',
      getTokenMethod: () async{
        return tokenStorage;
      }
    );
  }

  void cancelRequest(){
    authService?.cancelRequest();
  }
}