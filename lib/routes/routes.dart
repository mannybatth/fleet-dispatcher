import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:fleet_dispatcher/routes/auth_guard.dart';
import 'package:fleet_dispatcher/screens/company/company_screen.dart';
import 'package:fleet_dispatcher/screens/customers/customer_detail_screen.dart';
import 'package:fleet_dispatcher/screens/customers/customer_form.dart';
import 'package:fleet_dispatcher/screens/customers/customers_screen.dart';
import 'package:fleet_dispatcher/screens/dashboard/dashboard_screen.dart';
import 'package:fleet_dispatcher/screens/drivers/drivers_screen.dart';
import 'package:fleet_dispatcher/screens/loads/load_form.dart';
import 'package:fleet_dispatcher/screens/loads/loads_screen.dart';
import 'package:fleet_dispatcher/screens/login/login_screen.dart';

// Run: flutter packages pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(
      page: DashboardScreen,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      guards: [AuthGuard],
    ),
    CustomRoute(
      page: LoadsScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      guards: [AuthGuard],
    ),
    MaterialRoute(page: LoadForm, fullscreenDialog: true),
    CustomRoute(
      page: CustomersScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      guards: [AuthGuard],
    ),
    MaterialRoute(
      page: CustomerDetailScreen,
      guards: [AuthGuard],
    ),
    MaterialRoute(page: CustomerForm, fullscreenDialog: true),
    CustomRoute(
      page: CompanyScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      guards: [AuthGuard],
    ),
    CustomRoute(
      page: DriversScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      guards: [AuthGuard],
    ),
    CustomRoute(
      page: LoginScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ],
)
class $AppRouter {}
