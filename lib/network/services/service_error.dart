import 'package:dio/dio.dart';

String HandleError(DioError error) {
  String errorDescription = "";
  switch (error.type) {
    case DioErrorType.CANCEL:
      errorDescription = "Request to API server was cancelled";
      break;
    case DioErrorType.CONNECT_TIMEOUT:
      errorDescription = "Connection timeout with API server";
      break;
    case DioErrorType.RECEIVE_TIMEOUT:
      errorDescription = "Receive timeout in connection with API server";
      break;
    case DioErrorType.RESPONSE:
      switch (error.response.statusCode) {
        case 400:
          throw errorDescription = 'Error 400';
        case 401:
          //handle refresh token
        case 403:
          throw errorDescription = 'Error 403';
        case 404:
          throw errorDescription = 'Error 404';
        case 500:
          throw errorDescription = 'Error 500';
        default:
          throw "Received invalid status code: ${error.response.statusCode}";
      }
      break;
    case DioErrorType.SEND_TIMEOUT:
      errorDescription = "Send timeout in connection with API server";
      break;
    case DioErrorType.DEFAULT:
      errorDescription =
          "Connection to API server failed due to internet connection";
      break;
  }

  return errorDescription;
}
