import 'package:blocloginflow/network/services/services.dart';

class BaseRepository{
  HttpServices _httpServices;

  BaseRepository(this._httpServices);

  HttpServices get apiProvider => _httpServices;
}