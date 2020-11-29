import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/driver.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/stores/drivers_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class DriverDetailScreen extends StatefulWidget {
  final String driverId;
  DriverDetailScreen({Key key, this.driverId}) : super(key: key);

  @override
  _DriverDetailScreenState createState() => _DriverDetailScreenState();
}

class _DriverDetailScreenState extends State<DriverDetailScreen> {
  Driver driver;
  DriversStore store;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<DriversStore>(context);

    autorun((_) {
      setState(() {
        this.driver = store.drivers[widget.driverId];
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(this.driver.lastName),
      ),
      body: ListView(
        children: [
          ListTile(
            subtitle: Text('First Name'),
            title: Text(this.driver.firstName),
          ),
          ListTile(
            subtitle: Text('Last Name'),
            title: Text(this.driver.lastName),
          ),
          ListTile(
            subtitle: Text('Phone'),
            title: Text(this.driver.phone),
          ),
          ListTile(
            subtitle: Text('Truck #'),
            title: Text(this.driver.truckNum),
          ),
          ListTile(
            subtitle: Text('Trailer #'),
            title: Text(this.driver.trailerNum),
          ),
          SizedBox(height: 100)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.root.push(
            Routes.driverForm,
            arguments: DriverFormArguments(driver: driver),
          );
        },
        tooltip: 'Edit Driver',
        child: Icon(Icons.edit),
      ),
    );
  }
}
