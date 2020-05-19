import 'package:blocloginflow/network/services/service_interface.dart';
import 'package:meta/meta.dart';

class HttpServices{
  DioService authService;
  DioService nonAuthService;

  static final HttpServices _instance = HttpServices.internal();

  HttpServices.internal();

  factory HttpServices(){
    return _instance;
  }

  void init({@required authenService, @required nonAuthenService}){
    authService = authenService;
    nonAuthService = nonAuthenService;
  }

  void cancelRequest(){
    authService?.cancelRequest();
    nonAuthService?.cancelRequest();
  }
}