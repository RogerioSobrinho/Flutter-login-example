import 'package:equatable/equatable.dart';
import 'package:login/shared/models/user.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class StartLoginState extends LoginState {
  @override
  List<Object> get props => null;
}

class SuccessLoginState extends LoginState {
  final UserModel user;

  SuccessLoginState({this.user});

  @override
  List<Object> get props => [user];
}

class ErrorLoginState extends LoginState {
  final String message;

  ErrorLoginState({this.message});

  @override
  List<Object> get props => [message];
}

class StartLogOutState extends LoginState {
  @override
  List<Object> get props => null;
}

class SuccessLogOutState extends LoginState {
  @override
  List<Object> get props => null;
}
