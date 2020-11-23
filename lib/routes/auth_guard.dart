import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';

class AuthGuard extends RouteGuard {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<bool> canNavigate(
    ExtendedNavigatorState navigator,
    String routeName,
    Object arguments,
  ) async {
    if (auth.currentUser != null) {
      return true;
    }
    ExtendedNavigator.root.replace(Routes.loginScreen);
    return false;
  }
}
