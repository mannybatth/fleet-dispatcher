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
import 'package:dynamic_theme/dynamic_theme.dart';

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

  ThemeData _buildTheme(Brightness brightness) {
    final inputDecorationTheme = InputDecorationTheme(
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
    );

    final buttonTheme = ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
    );

    return brightness == Brightness.dark
        ? ThemeData.dark().copyWith(
            appBarTheme: AppBarTheme(
              shadowColor: Colors.transparent,
            ),
            shadowColor: Colors.transparent,
            textTheme: ThemeData.dark().textTheme.apply(),
            inputDecorationTheme: inputDecorationTheme,
            buttonTheme: buttonTheme,
          )
        : ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(
              shadowColor: Colors.transparent,
            ),
            shadowColor: Colors.transparent,
            textTheme: ThemeData.light().textTheme.apply(),
            inputDecorationTheme: inputDecorationTheme,
            buttonTheme: buttonTheme,
            scaffoldBackgroundColor: Colors.grey.shade200,
          );
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Brightness.light;

    if (_error) {
      return Theme(
        data: ThemeData(
          brightness: brightness,
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
          brightness: brightness,
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
      child: DynamicTheme(
        defaultBrightness: brightness,
        data: (brightness) => _buildTheme(brightness),
        themedWidgetBuilder: (context, theme) {
          return new MaterialApp(
            title: 'Fleet Dispatcher',
            theme: theme,
            debugShowCheckedModeBanner: false,
            builder: ExtendedNavigator.builder<AppRouter>(
              router: AppRouter(),
              guards: [AuthGuard()],
              builder: (context, extendedNav) => extendedNav,
            ),
          );
        },
      ),
    );
  }
}
