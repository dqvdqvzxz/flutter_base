import 'package:blocloginflow/app.dart';
import 'package:blocloginflow/authentication/authentication.dart';
import 'package:blocloginflow/common/common.dart';
import 'package:blocloginflow/network/services/services.dart';
import 'package:blocloginflow/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'network/intercepter/logging_intercepter.dart';
import 'network/services/service_auth.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository(HttpServices());

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context){
        initHttpRequest();
        return AuthenticationBloc(userRepository: userRepository)
            ..add(AppStarted());
      },
      child: App(userRepository: userRepository),
    )
  );
}

void initHttpRequest() async {

  BaseOptions _baseOptions = BaseOptions(
      baseUrl: 'https://randomuser.me/api/',
      receiveTimeout: 30000,
      connectTimeout: 30000,
      sendTimeout: 30000,
      responseType: ResponseType.json
  );

  var tokenStorage = 'token';
  print('token: token');
  HttpServices().init(
    authenService: DioServiceAuth().init(
        baseOptions: _baseOptions,
        interceptors: [
          LoggingInterceptor(),
        ],
        authenticationSchema: '',
        getTokenMethod: () async{
          return tokenStorage;
        }
    )
  );
}
