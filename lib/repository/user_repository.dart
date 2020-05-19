import 'package:blocloginflow/common/common.dart';
import 'package:blocloginflow/models/user_model.dart';
import 'package:blocloginflow/network/services/base_repository.dart';
import 'package:blocloginflow/network/services/services.dart';
import 'package:meta/meta.dart';
import 'dart:async';
import 'package:blocloginflow/constant/constant.dart' as Constant;


class UserRepository extends BaseRepository{
  UserRepository(HttpServices httpServices) : super(httpServices);

  Future<List<String>> authenticate({
    @required String username,
    @required String password,
  }) async {
    String accessToken;
    String refreshToken;

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
          if(response.statusCode == 200){
            var dataResult = ParseDataToJson.fromJson(response.data);
            var userData = TokenData.fromJson(dataResult.data);

            accessToken = userData.accessToken;
            refreshToken = userData.refreshToken;
          }
        },
        onError: (error){
          print('Call me error: $error');
        }
    );

    return [accessToken, refreshToken];
  }

  //delete from keychain
  Future<void> deleteToken() async {

    //delete from keychain
    await removeFromSP(stringKey: 'accessToken');

    return;
  }

  //save to keychain
  Future<void> persistToken(String accessToken, String refreshToken) async {
    //save access token
    await saveStringToSP(stringKey: 'accessToken', stringValue: accessToken);

    //save refresh token
    await saveStringToSP(stringKey: 'refreshToken', stringValue: refreshToken);

    return;
  }

  //read from keychain
  Future<bool> hasToken() async {
    //check token on keychain
    if(checkKeyOnSP(stringKey: 'accessToken'))
      return true;
    return false;
  }
}
