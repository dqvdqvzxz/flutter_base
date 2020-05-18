import 'package:blocloginflow/network/services/service_interface.dart';
import 'package:meta/meta.dart';

class HttpServices{
  DioService authService;

  static final HttpServices _instance = HttpServices.internal();

  HttpServices.internal();

  factory HttpServices(){
    return _instance;
  }

  void init({@required authenService}){
    authService = authenService;
  }

  void cancelRequest(){
    authService?.cancelRequest();
  }
}