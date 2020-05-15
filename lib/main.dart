import 'package:blocloginflow/app.dart';
import 'package:blocloginflow/authentication/authentication.dart';
import 'package:blocloginflow/common/common.dart';
import 'package:blocloginflow/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocloginflow/network/services/services.dart';

void main(){
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  HttpServices().initHttpRequest();

  demoCallAPI();

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



void demoCallAPI(){
  print('Call me C');
  HttpServices().authService.get(
      '/',
      onResponse: (response){
        print('Call me: ${response.data}');
      },
      onError: (error){
        print('Call me error: ${error}');
      }
  );
}
