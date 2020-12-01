import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/stores/loads_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadService {
  static Future<void> getLoads(BuildContext context) async {
    LoadsStore store = context.read<LoadsStore>();
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('loads').get();
    final loads = querySnapshot.docs
        .map((item) => Load.fromJson(item.id, item.data()))
        .toList();
    store.saveLoads(loads);
  }

  static Future<void> createLoad(
    BuildContext context,
    Load load,
  ) async {
    LoadsStore store = context.read<LoadsStore>();
    load.ownerId = FirebaseAuth.instance.currentUser.uid;
    load.status = load.status ?? LoadStatus.NONE;
    final loadJson = load.toJson();

    final docRef =
        await FirebaseFirestore.instance.collection('loads').add(loadJson);
    load.id = docRef.id;
    store.addLoad(load);
  }

  static Future<void> updateLoad(
    BuildContext context,
    String loadId,
    Load load,
  ) async {
    LoadsStore store = context.read<LoadsStore>();
    final loadJson = load.toJson();

    await FirebaseFirestore.instance
        .collection('loads')
        .doc(loadId)
        .update(loadJson);

    store.addLoad(Load.fromJson(loadId, loadJson));
  }
}
