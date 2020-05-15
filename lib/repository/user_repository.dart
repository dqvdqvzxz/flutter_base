import 'package:meta/meta.dart';
import 'dart:async';

//share_preference lib

class UserRepository {
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
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
