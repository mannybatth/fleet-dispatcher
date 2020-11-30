import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/routes/auth_guard.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/stores/company_store.dart';
import 'package:fleet_dispatcher/stores/customers_store.dart';
import 'package:fleet_dispatcher/stores/drivers_store.dart';
import 'package:fleet_dispatcher/stores/loads_store.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
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
    if (_error) {
      return Theme(
        data: ThemeData(
          brightness: Brightness.dark,
        ),
        child: Material(
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
        ),
      );
    }

    if (!_initialized) {
      return Theme(
        data: ThemeData(
          brightness: Brightness.dark,
        ),
        child: Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        Provider<LoadsStore>(create: (_) => LoadsStore()),
        Provider<CustomersStore>(create: (_) => CustomersStore()),
        Provider<DriversStore>(create: (_) => DriversStore()),
        Provider<CompanyStore>(create: (_) => CompanyStore()),
      ],
      child: MaterialApp(
        title: 'Fleet Dispatcher',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator.builder<AppRouter>(
          router: AppRouter(),
          guards: [AuthGuard()],
          builder: (context, extendedNav) => Theme(
            data: ThemeData(
              brightness: Brightness.dark,
              appBarTheme: AppBarTheme(
                actionsIconTheme: IconThemeData(color: Colors.white),
              ),
              primarySwatch: Colors.blue,
              buttonTheme: ButtonThemeData(
                buttonColor: Colors.blue,
                textTheme: ButtonTextTheme.primary,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              ),
              inputDecorationTheme: InputDecorationTheme(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade800,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            child: extendedNav,
          ),
        ),
      ),
    );
  }
}
