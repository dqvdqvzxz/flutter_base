class ParseDataToJson {
  String httpCode;
  dynamic data;
  Error error;
  String forceUpdate;

  ParseDataToJson({
    this.httpCode,
    this.data,
    this.error,
    this.forceUpdate,
  });

  factory ParseDataToJson.fromJson(Map<String, dynamic> json) {
    return ParseDataToJson(
        httpCode: json['http_code'],
        data: json['data'],
        error: Error.fromJson(json['error']),
        forceUpdate: json['force_update']);
  }
}

class Error {
  String errorCode;
  String errorMessage;

  Error({this.errorCode, this.errorMessage});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
        errorCode: json['error_code'], errorMessage: json['error_message']);
  }
}

class TokenData {
  String tokenType;
  int expiredIn;
  String accessToken;
  String refreshToken;

  TokenData({
    this.tokenType,
    this.expiredIn,
    this.accessToken,
    this.refreshToken,
  });

  factory TokenData.fromJson(Map<String, dynamic> json){
    return TokenData(
      tokenType: json['token_type'],
      expiredIn: json['expires_in'],
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
    );
  }
}
