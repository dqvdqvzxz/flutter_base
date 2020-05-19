import 'dart:convert';

import 'package:blocloginflow/common/common.dart';
import 'package:blocloginflow/network/services/base_repository.dart';
import 'package:blocloginflow/network/services/services.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:blocloginflow/constant/constant.dart' as Constant;


//share_preference lib
import 'package:dio/dio.dart';

class UserRepository extends BaseRepository{
  UserRepository(HttpServices httpServices) : super(httpServices);

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {

//    Response response;
//    Dio dio = new Dio();
////    response = await dio.get("/test?id=12&name=wendu");
////    print(response.data.toString());
//// Optionally the request above could also be done as
//    response = await dio.post("http://ec2-3-112-235-245.ap-northeast-1.compute.amazonaws.com/api/v1/oauth/token", data: {'username' : username,
//      'password' : password,
//      'client_id' : Constant.Config.CONFIG_CLIENT_ID,
//      'client_secret' : Constant.Config.CONFIG_CLIENT_SECRET,
//      'grant_type' : Constant.Config.CONFIG_GRANT_TYPE_PASSWORD,});
//
//    print('Call me API POST: ${response.request}');

    var mapData = new Map<String, dynamic>();
    mapData['username'] = username;
    mapData['password'] = password;
    mapData['client_id'] = Constant.Config.CONFIG_CLIENT_ID;
    mapData['client_secret'] = Constant.Config.CONFIG_CLIENT_SECRET;
    mapData['grant_type'] = Constant.Config.CONFIG_GRANT_TYPE_PASSWORD;

    apiProvider.nonAuthService.post(
        '${Constant.API_URL_TOKEN}',
        data: mapData,
        onResponse: (response) async{
//          print('Call me: ${response.data}');
        },
        onError: (error){
          print('Call me error: $error');
        }
    );

//    apiProvider.authService.get(
//        '/',
//        onResponse: (response){
//          print('Call me: ${response.data}');
//        },
//        onError: (error){
//          print('Call me error: $error');
//        }
//    );
    return 'token';
  }

  //delete from keychain
  Future<void> deleteToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  //save to keychain
  Future<void> persistToken(String token) async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  //read from keychain
  Future<bool> hasToken() async {
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
