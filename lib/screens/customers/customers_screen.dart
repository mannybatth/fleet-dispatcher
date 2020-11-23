import 'package:fleet_dispatcher/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CustomersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customers'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'Customers',
        ),
      ),
    );
  }
}
