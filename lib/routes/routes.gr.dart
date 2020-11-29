// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/company.dart';
import '../models/customer.dart';
import '../models/driver.dart';
import '../models/load.dart';
import '../screens/company/company_form.dart';
import '../screens/company/company_screen.dart';
import '../screens/customers/customer_detail_screen.dart';
import '../screens/customers/customer_form.dart';
import '../screens/customers/customers_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/drivers/driver_detail_screen.dart';
import '../screens/drivers/driver_form.dart';
import '../screens/drivers/drivers_screen.dart';
import '../screens/loads/load_detail_screen.dart';
import '../screens/loads/load_form.dart';
import '../screens/loads/loads_screen.dart';
import '../screens/login/login_screen.dart';
import 'auth_guard.dart';

class Routes {
  static const String dashboardScreen = '/';
  static const String loadsScreen = '/loads-screen';
  static const String loadDetailScreen = '/load-detail-screen';
  static const String loadForm = '/load-form';
  static const String customersScreen = '/customers-screen';
  static const String customerDetailScreen = '/customer-detail-screen';
  static const String customerForm = '/customer-form';
  static const String companyScreen = '/company-screen';
  static const String companyForm = '/company-form';
  static const String driversScreen = '/drivers-screen';
  static const String driverDetailScreen = '/driver-detail-screen';
  static const String driverForm = '/driver-form';
  static const String loginScreen = '/login-screen';
  static const all = <String>{
    dashboardScreen,
    loadsScreen,
    loadDetailScreen,
    loadForm,
    customersScreen,
    customerDetailScreen,
    customerForm,
    companyScreen,
    companyForm,
    driversScreen,
    driverDetailScreen,
    driverForm,
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
    RouteDef(Routes.loadDetailScreen,
        page: LoadDetailScreen, guards: [AuthGuard]),
    RouteDef(Routes.loadForm, page: LoadForm),
    RouteDef(Routes.customersScreen,
        page: CustomersScreen, guards: [AuthGuard]),
    RouteDef(Routes.customerDetailScreen,
        page: CustomerDetailScreen, guards: [AuthGuard]),
    RouteDef(Routes.customerForm, page: CustomerForm),
    RouteDef(Routes.companyScreen, page: CompanyScreen, guards: [AuthGuard]),
    RouteDef(Routes.companyForm, page: CompanyForm),
    RouteDef(Routes.driversScreen, page: DriversScreen, guards: [AuthGuard]),
    RouteDef(Routes.driverDetailScreen,
        page: DriverDetailScreen, guards: [AuthGuard]),
    RouteDef(Routes.driverForm, page: DriverForm),
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
    LoadDetailScreen: (data) {
      final args = data.getArgs<LoadDetailScreenArguments>(
        orElse: () => LoadDetailScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoadDetailScreen(
          key: args.key,
          loadId: args.loadId,
        ),
        settings: data,
      );
    },
    LoadForm: (data) {
      final args = data.getArgs<LoadFormArguments>(
        orElse: () => LoadFormArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoadForm(
          key: args.key,
          load: args.load,
        ),
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
    CompanyForm: (data) {
      final args = data.getArgs<CompanyFormArguments>(
        orElse: () => CompanyFormArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CompanyForm(
          key: args.key,
          company: args.company,
        ),
        settings: data,
        fullscreenDialog: true,
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
    DriverDetailScreen: (data) {
      final args = data.getArgs<DriverDetailScreenArguments>(
        orElse: () => DriverDetailScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DriverDetailScreen(
          key: args.key,
          driverId: args.driverId,
        ),
        settings: data,
      );
    },
    DriverForm: (data) {
      final args = data.getArgs<DriverFormArguments>(
        orElse: () => DriverFormArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => DriverForm(
          key: args.key,
          driver: args.driver,
        ),
        settings: data,
        fullscreenDialog: true,
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

/// LoadDetailScreen arguments holder class
class LoadDetailScreenArguments {
  final Key key;
  final String loadId;
  LoadDetailScreenArguments({this.key, this.loadId});
}

/// LoadForm arguments holder class
class LoadFormArguments {
  final Key key;
  final Load load;
  LoadFormArguments({this.key, this.load});
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

/// CompanyForm arguments holder class
class CompanyFormArguments {
  final Key key;
  final Company company;
  CompanyFormArguments({this.key, this.company});
}

/// DriverDetailScreen arguments holder class
class DriverDetailScreenArguments {
  final Key key;
  final String driverId;
  DriverDetailScreenArguments({this.key, this.driverId});
}

/// DriverForm arguments holder class
class DriverFormArguments {
  final Key key;
  final Driver driver;
  DriverFormArguments({this.key, this.driver});
}
