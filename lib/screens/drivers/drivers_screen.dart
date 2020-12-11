import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/services/driver_service.dart';
import 'package:fleet_dispatcher/stores/drivers_store.dart';
import 'package:fleet_dispatcher/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class DriversScreen extends StatefulWidget {
  @override
  _DriversScreenState createState() => _DriversScreenState();
}

class _DriversScreenState extends State<DriversScreen> {
  DriversStore store;

  void initState() {
    super.initState();
    DriverService.getDrivers(context);
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<DriversStore>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Drivers'),
      ),
      drawer: AppDrawer(),
      body: Observer(
        builder: (_) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              height: 1,
              indent: 10,
              endIndent: 10,
            ),
            itemCount: store.driversList.length,
            itemBuilder: (context, index) {
              final driver = store.driversList[index];
              return InkWell(
                onTap: () {
                  ExtendedNavigator.root.push(
                    Routes.driverDetailScreen,
                    arguments: DriverDetailScreenArguments(driverId: driver.id),
                  );
                },
                child: ListTile(
                  mouseCursor: SystemMouseCursors.click,
                  title: Text(driver.fullName),
                  subtitle: Text(driver.phone),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.root.push(Routes.driverForm);
        },
        tooltip: 'Add Driver',
        child: Icon(Icons.add),
      ),
    );
  }
}
