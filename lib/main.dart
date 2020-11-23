import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/routes/auth_guard.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simple_auth_flutter/simple_auth_flutter.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool _initialized = false;
  bool _error = false;

  // // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  void initState() {
    initializeFlutterFire();
    super.initState();
    SimpleAuthFlutter.init(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget getAppContent() {
      if (_error) {
        return Material(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('App failed to load.'),
                SizedBox(height: 30),
                RaisedButton(
                  child: Text('Try Again'),
                  onPressed: () {
                    setState(() {
                      _initialized = false;
                      _error = false;
                    });
                    initializeFlutterFire();
                  },
                ),
              ],
            ),
          ),
        );
      }

      if (!_initialized) {
        return Material(child: Center(child: CircularProgressIndicator()));
      }

      return MaterialApp(
        title: 'Fleet Dispatcher',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator.builder<AppRouter>(
          router: AppRouter(),
          guards: [AuthGuard()],
          builder: (context, extendedNav) => Theme(
            data: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.blue,
              buttonTheme: ButtonThemeData(
                buttonColor: Colors.blue,
                textTheme: ButtonTextTheme.primary,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              ),
            ),
            child: extendedNav,
          ),
        ),
      );
    }

    return getAppContent();
  }
}
