import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';
import 'bloc/login_event.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'LOGIN_PAGE';
  final String message;
  LoginPage({Key key, this.message}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _cEmail =
      new TextEditingController(text: "rogerioa.sobrinho@gmail.com");
  final _cPassword = new TextEditingController(text: "123456789");

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);

    _authentication() {
      final sigInEvent =
          SignInEvent(email: _cEmail.text, password: _cPassword.text);
      bloc.dispatch(sigInEvent);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _cEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(labelText: "E-mail"),
            ),
            TextField(
              controller: _cPassword,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            widget.message != null
                ? Text(widget.message, style: TextStyle(color: Colors.red))
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: MaterialButton(
                child: Text(
                  "Entrar",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () => _authentication(),
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
