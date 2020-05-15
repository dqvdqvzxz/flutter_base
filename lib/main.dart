import 'package:blocloginflow/app.dart';
import 'package:blocloginflow/authentication/authentication.dart';
import 'package:blocloginflow/common/common.dart';
import 'package:blocloginflow/network/services/user_service.dart';
import 'package:blocloginflow/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocloginflow/network/services/services.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  HttpServices().initHttpRequest();

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
