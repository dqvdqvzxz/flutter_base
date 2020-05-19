import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String accessToken;
  final String refreshToken;

  const LoggedIn({@required this.accessToken, this.refreshToken});

  @override
  List<Object> get props => [accessToken];

  @override
  String toString() => 'LoggedIn {token: $accessToken}';
}

class LoggedOut extends AuthenticationEvent {}
