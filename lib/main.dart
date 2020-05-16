import 'package:blocloginflow/app.dart';
import 'package:blocloginflow/authentication/authentication.dart';
import 'package:blocloginflow/common/common.dart';
import 'package:blocloginflow/network/services/user_service.dart';
import 'package:blocloginflow/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocloginflow/network/services/services.dart';

import 'network/intercepter/logging_intercepter.dart';
import 'network/services/service_auth.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();


  initHttpRequest();



  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context){
        return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted());
      },
      child: App(userRepository: userRepository),
    )
  );
}

void initHttpRequest(){
  var tokenStorage = 'token';
  print('token: token');

  BaseOptions _baseOptions = BaseOptions(
      baseUrl: 'https://randomuser.me/api/',
      receiveTimeout: 30000,
      connectTimeout: 30000,
      sendTimeout: 30000,
      responseType: ResponseType.json
  );

  HttpServices().init(authService: DioServiceAuth().init(
      baseOptions: _baseOptions,
      interceptors: [
        LoggingInterceptor(),
      ],
      authenticationSchema: '',
      getTokenMethod: () async{
        return tokenStorage;
      }
  ));
}
