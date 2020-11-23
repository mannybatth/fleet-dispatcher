import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/utils/google_auth.dart';
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
            leading: Icon(Icons.home),
            title: Text('Dashboard'),
            onTap: () {
              ExtendedNavigator.root.pop();
              ExtendedNavigator.root.replace(Routes.dashboardScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.local_shipping),
            title: Text('Loads'),
            onTap: () {
              ExtendedNavigator.root.pop();
              ExtendedNavigator.root.replace(Routes.loadsScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Customers'),
            onTap: () {
              ExtendedNavigator.root.pop();
              ExtendedNavigator.root.replace(Routes.customersScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Drivers'),
            onTap: () {
              ExtendedNavigator.root.pop();
              ExtendedNavigator.root.replace(Routes.driversScreen);
            },
          ),
          ListTile(
            leading: Icon(Icons.business),
            title: Text('Company'),
            onTap: () {
              ExtendedNavigator.root.pop();
              ExtendedNavigator.root.replace(Routes.companyScreen);
            },
          ),
          ListTile(
            trailing: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              logout();
              ExtendedNavigator.root.pop();
              ExtendedNavigator.root.replace(Routes.loginScreen);
            },
          ),
        ],
      ),
    );
  }
}
