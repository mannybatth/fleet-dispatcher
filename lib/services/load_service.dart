import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/services/customer_service.dart';
import 'package:fleet_dispatcher/services/driver_service.dart';
import 'package:fleet_dispatcher/services/invoice_service.dart';
import 'package:fleet_dispatcher/stores/loads_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadService {
  static Future<void> getLoads(BuildContext context) async {
    LoadsStore loadsStore = Provider.of<LoadsStore>(context, listen: false);
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('loads')
        .orderBy('pickUpDate', descending: true)
        .get();
    final loads = querySnapshot.docs
        .map((item) => Load.fromJson(item.id, item.data()))
        .toList();
    final populatedLoads = await Future.wait(loads.map((load) async {
      load.customer =
          await CustomerService.getCustomer(context, load.customerId);
      load.driver = await DriverService.getDriver(context, load.driverId);
      if (load.invoiceId != null) {
        load.invoice = await InvoiceService.getInvoice(context, load.invoiceId);
      }
      return load;
    }));
    loadsStore.saveLoads(populatedLoads);
  }

  static Future<Load> createLoad(
    BuildContext context,
    Load load,
  ) async {
    LoadsStore store = Provider.of<LoadsStore>(context, listen: false);
    load.ownerId = FirebaseAuth.instance.currentUser.uid;
    load.status = load.status ?? LoadStatus.NONE;
    final loadJson = load.toJson();

    final docRef =
        await FirebaseFirestore.instance.collection('loads').add(loadJson);
    load.id = docRef.id;
    load.customer = await CustomerService.getCustomer(context, load.customerId);
    load.driver = await DriverService.getDriver(context, load.driverId);
    store.addLoad(load);
    return load;
  }

  static Future<void> updateLoad(
    BuildContext context,
    String loadId,
    Load load,
  ) async {
    LoadsStore store = Provider.of<LoadsStore>(context, listen: false);
    final loadJson = load.toJson();

    await FirebaseFirestore.instance
        .collection('loads')
        .doc(loadId)
        .set(loadJson);

    final newLoad = Load.fromJson(loadId, loadJson);
    newLoad.customer =
        await CustomerService.getCustomer(context, load.customerId);
    newLoad.driver = await DriverService.getDriver(context, load.driverId);
    store.addLoad(newLoad);
  }

  static Future<void> updateLoadInvoiceId(
    BuildContext context,
    String loadId,
    String invoiceId,
  ) async {
    LoadsStore store = Provider.of<LoadsStore>(context, listen: false);

    await FirebaseFirestore.instance
        .collection('loads')
        .doc(loadId)
        .update({'invoiceId': invoiceId});

    final load = store.loads[loadId];
    load.invoiceId = invoiceId;
    store.addLoad(load);
  }
}
