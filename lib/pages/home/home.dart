import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/pages/login/bloc/bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'HOME_PAGE';
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<LoginBloc>(context);
    _logOut() {
      LogOutEvent logOutEvent = new LogOutEvent();
      bloc.dispatch(logOutEvent);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => _logOut(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome!',
            ),
          ],
        ),
      ),
    );
  }
}
