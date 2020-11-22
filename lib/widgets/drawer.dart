import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Fleet Dispatcher'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              ExtendedNavigator.root.pop();
              ExtendedNavigator.root.replace(Routes.dashboardScreen);
            },
          ),
          ListTile(
            title: Text('Loads'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              ExtendedNavigator.root.pop();
              ExtendedNavigator.root.replace(Routes.loadsScreen);
            },
          ),
        ],
      ),
    );
  }
}
