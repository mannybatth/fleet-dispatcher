import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:fleet_dispatcher/screens/dashboard/dashboard_screen.dart';
import 'package:fleet_dispatcher/screens/loads/load_form.dart';
import 'package:fleet_dispatcher/screens/loads/loads_screen.dart';

// Run: flutter packages pub run build_runner watch --delete-conflicting-outputs

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    CustomRoute(
      page: DashboardScreen,
      initial: true,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    CustomRoute(
      page: LoadsScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    MaterialRoute(page: LoadForm, fullscreenDialog: true),
  ],
)
class $AppRouter {}
