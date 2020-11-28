import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/stores/loads_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadService {
  static void getLoads(BuildContext context) async {
    print('GETTING LOADS');
    LoadsStore store = context.read<LoadsStore>();
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('loads').get();
    final loads = querySnapshot.docs
        .map((item) => Load.fromJson(item.id, item.data()))
        .toList();
    store.saveLoads(loads);
  }
}
