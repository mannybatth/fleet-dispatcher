// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/company/company_screen.dart';
import '../screens/customers/customers_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/drivers/drivers_screen.dart';
import '../screens/loads/load_form.dart';
import '../screens/loads/loads_screen.dart';
import '../screens/login/login_screen.dart';
import 'auth_guard.dart';

class Routes {
  static const String dashboardScreen = '/';
  static const String loadsScreen = '/loads-screen';
  static const String loadForm = '/load-form';
  static const String customersScreen = '/customers-screen';
  static const String companyScreen = '/company-screen';
  static const String driversScreen = '/drivers-screen';
  static const String loginScreen = '/login-screen';
  static const all = <String>{
    dashboardScreen,
    loadsScreen,
    loadForm,
    customersScreen,
    companyScreen,
    driversScreen,
    loginScreen,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.dashboardScreen,
        page: DashboardScreen, guards: [AuthGuard]),
    RouteDef(Routes.loadsScreen, page: LoadsScreen, guards: [AuthGuard]),
    RouteDef(Routes.loadForm, page: LoadForm),
    RouteDef(Routes.customersScreen,
        page: CustomersScreen, guards: [AuthGuard]),
    RouteDef(Routes.companyScreen, page: CompanyScreen, guards: [AuthGuard]),
    RouteDef(Routes.driversScreen, page: DriversScreen, guards: [AuthGuard]),
    RouteDef(Routes.loginScreen, page: LoginScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    DashboardScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            DashboardScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    LoadsScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => LoadsScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    LoadForm: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoadForm(),
        settings: data,
        fullscreenDialog: true,
      );
    },
    CustomersScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CustomersScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    CompanyScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            CompanyScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    DriversScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            DriversScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    LoginScreen: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
  };
}
