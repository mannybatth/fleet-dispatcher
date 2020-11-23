import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/utils/google_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _loading = false;

  void initState() {
    super.initState();

    auth.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  void _onLoginPressed() async {
    setState(() {
      _loading = true;
    });
    await doLogin();

    if (auth.currentUser != null) {
      print('USER FOUND ${auth.currentUser.uid}');
      ExtendedNavigator.root.replace(Routes.dashboardScreen);
    }
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget loginButton() {
      if (_loading) return CircularProgressIndicator();
      return RaisedButton(
        child: Text(
          'Login',
          style: TextStyle(fontSize: 25),
        ),
        onPressed: _onLoginPressed,
      );
    }

    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Fleet Dispatcher App',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          Container(
            height: 50,
            child: Center(
              child: loginButton(),
            ),
          ),
        ],
      ),
    );
  }
}
