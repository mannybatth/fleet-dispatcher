import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleet_dispatcher/models/company.dart';
import 'package:fleet_dispatcher/stores/company_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyService {
  static Future<void> getCompany(BuildContext context) async {
    CompanyStore store = context.read<CompanyStore>();
    final userId = FirebaseAuth.instance.currentUser.uid;
    final DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('companies')
        .doc(userId)
        .get();

    if (docSnapshot.exists) {
      Company company = Company.fromJson(docSnapshot.id, docSnapshot.data());
      store.saveCompany(company);
    }
  }

  static Future<void> updateCompany(
      BuildContext context, Company company) async {
    CompanyStore store = context.read<CompanyStore>();
    final userId = FirebaseAuth.instance.currentUser.uid;
    await FirebaseFirestore.instance
        .collection('companies')
        .doc(userId)
        .set(company.toJson());
    store.saveCompany(company);
  }
}
