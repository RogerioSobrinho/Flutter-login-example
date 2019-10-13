import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:login/shared/models/user.dart';
import 'package:login/shared/services/auth.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  AuthService authService;
  LoginBloc() {
    authService = new AuthService();
  }

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SignInEvent) {
      try {
        yield StartLoginState();
        UserModel user = await authService.signIn(event.email, event.password);
        if (user == null) {
          yield ErrorLoginState(message: "E-mail ou senha inválido.");
        } else {
          yield SuccessLoginState(user: user);
        }
      } catch (e) {
        yield ErrorLoginState(message: "Ops! Ocorreu um imprevisto.");
        print(e);
      }
    }

    if (event is LogOutEvent) {
      try {
        yield StartLogOutState();
        await authService.logOut();
        yield SuccessLogOutState();
      } catch (e) {
        print(e);
      }
    }
  }

  Future checkAuthenticate() async {
    var user = await authService.getUser();
    return Future.value(user);
  }
}
