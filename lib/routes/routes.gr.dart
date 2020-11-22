// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/dashboard/dashboard_screen.dart';
import '../screens/loads/load_form.dart';
import '../screens/loads/loads_screen.dart';

class Routes {
  static const String dashboardScreen = '/';
  static const String loadsScreen = '/loads-screen';
  static const String loadForm = '/load-form';
  static const all = <String>{
    dashboardScreen,
    loadsScreen,
    loadForm,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.dashboardScreen, page: DashboardScreen),
    RouteDef(Routes.loadsScreen, page: LoadsScreen),
    RouteDef(Routes.loadForm, page: LoadForm),
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
  };
}
