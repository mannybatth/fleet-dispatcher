// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/customer.dart';
import '../models/load.dart';
import '../screens/company/company_screen.dart';
import '../screens/customers/customer_detail_screen.dart';
import '../screens/customers/customer_form.dart';
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
  static const String customerDetailScreen = '/customer-detail-screen';
  static const String customerForm = '/customer-form';
  static const String companyScreen = '/company-screen';
  static const String driversScreen = '/drivers-screen';
  static const String loginScreen = '/login-screen';
  static const all = <String>{
    dashboardScreen,
    loadsScreen,
    loadForm,
    customersScreen,
    customerDetailScreen,
    customerForm,
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
    RouteDef(Routes.customerDetailScreen,
        page: CustomerDetailScreen, guards: [AuthGuard]),
    RouteDef(Routes.customerForm, page: CustomerForm),
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
      final args = data.getArgs<LoadFormArguments>(
        orElse: () => LoadFormArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoadForm(load: args.load),
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
    CustomerDetailScreen: (data) {
      final args = data.getArgs<CustomerDetailScreenArguments>(
        orElse: () => CustomerDetailScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CustomerDetailScreen(
          key: args.key,
          customerId: args.customerId,
        ),
        settings: data,
      );
    },
    CustomerForm: (data) {
      final args = data.getArgs<CustomerFormArguments>(
        orElse: () => CustomerFormArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CustomerForm(
          key: args.key,
          customer: args.customer,
        ),
        settings: data,
        fullscreenDialog: true,
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

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// LoadForm arguments holder class
class LoadFormArguments {
  final Load load;
  LoadFormArguments({this.load});
}

/// CustomerDetailScreen arguments holder class
class CustomerDetailScreenArguments {
  final Key key;
  final String customerId;
  CustomerDetailScreenArguments({this.key, this.customerId});
}

/// CustomerForm arguments holder class
class CustomerFormArguments {
  final Key key;
  final Customer customer;
  CustomerFormArguments({this.key, this.customer});
}
