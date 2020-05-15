import 'package:blocloginflow/authentication/authentication.dart';
import 'package:blocloginflow/common/common.dart';
import 'package:blocloginflow/home/home.dart';
import 'package:blocloginflow/login/login.dart';
import 'package:blocloginflow/repository/repository.dart';
import 'package:blocloginflow/splash/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {

  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state){
          if(state is AuthenticationAuthenticated){
            return HomePage();
          }

          if(state is AuthenticationUnauthenticated){
            return LoginPage(userRepository: userRepository);
          }

          if(state is AuthenticationLoading){
            return LoadingIndicator();
          }

          return SplashPage();
        },
      ),
    );
  }
}
