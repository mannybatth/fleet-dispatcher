import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet_dispatcher/models/driver.dart';
import 'package:fleet_dispatcher/stores/drivers_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DriverService {
  static Future<void> getDrivers(BuildContext context) async {
    DriversStore store = context.read<DriversStore>();
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('drivers').get();
    final drivers = querySnapshot.docs
        .map((item) => Driver.fromJson(item.id, item.data()))
        .toList();
    store.saveDrivers(drivers);
  }

  static Future<void> createDriver(
    BuildContext context,
    Driver driver,
  ) async {
    DriversStore store = context.read<DriversStore>();
    final driverJson = driver.toJson();

    final docRef =
        await FirebaseFirestore.instance.collection('drivers').add(driverJson);
    driver.id = docRef.id;
    store.addDriver(driver);
  }

  static Future<void> updateDriver(
    BuildContext context,
    String driverId,
    Driver driver,
  ) async {
    DriversStore store = context.read<DriversStore>();
    final driverJson = driver.toJson();

    await FirebaseFirestore.instance
        .collection('drivers')
        .doc(driverId)
        .update(driverJson);

    store.addDriver(Driver.fromJson(driverId, driverJson));
  }
}
