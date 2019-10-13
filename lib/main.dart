import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/pages/home/home.dart';
import 'package:login/pages/login/bloc/login_bloc.dart';
import 'package:login/pages/login/bloc/login_event.dart';
import 'package:login/pages/login/bloc/login_state.dart';
import 'package:login/pages/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        HomePage.routeName: (context) => HomePage(title: "Welcome!"),
        LoginPage.routeName: (context) => LoginPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            builder: (context) => LoginBloc(),
          ),
        ],
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is StartLoginState || state is StartLogOutState)
              return loading();

            if (state is ErrorLoginState)
              return LoginPage(message: state.message);

            if (state is SuccessLoginState) return HomePage(title: "Welcome!");

            return FutureBuilder(
              future: BlocProvider.of<LoginBloc>(context).checkAuthenticate(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return loading();
                } else {
                  return snapshot.data != null
                      ? HomePage(title: "Welcome!")
                      : LoginPage();
                }
              },
            );
          },
        ),
      ),
      // home: LoginPage(), //HomePage(title: 'Flutter Demo Home Page'),
    );
  }

  Center loading() {
    return Center(child: CircularProgressIndicator());
  }
}
