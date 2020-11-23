import 'package:fleet_dispatcher/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CompanyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'Company Details',
        ),
      ),
    );
  }
}
