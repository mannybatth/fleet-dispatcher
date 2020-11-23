import 'package:fleet_dispatcher/widgets/drawer.dart';
import 'package:flutter/material.dart';

class DriversScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drivers'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'Drivers',
        ),
      ),
    );
  }
}
