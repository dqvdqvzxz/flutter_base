import 'package:blocloginflow/network/services/base_repository.dart';
import 'package:blocloginflow/network/services/services.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:dio/dio.dart';


//share_preference lib

class UserRepository extends BaseRepository{
  UserRepository(HttpServices httpServices) : super(httpServices);

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    apiProvider.authService.get(
        '/',
        onResponse: (response){
          print('Call me: ${response.data}');
        },
        onError: (error){
          print('Call me error: $error');
        }
    );
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
