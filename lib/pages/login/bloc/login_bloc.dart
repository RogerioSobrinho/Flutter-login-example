import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:login/shared/models/user.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is SignInEvent) {
      try {
        yield StartLoginState();
        UserModel user = await _authenticate(event.email, event.password);
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
        yield SuccessLogOutState();
      } catch (e) {
        print(e);
      }
    }
  }
}

Future<UserModel> _authenticate(String email, String password) {
  return Future.delayed(Duration(seconds: 3), () {
    if (email == 'rogerioa.sobrinho@gmail.com' && password == '123456789')
      return UserModel(email: email, name: 'Rogerio Sobrinho');
    return null;
  });
}
