import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleet_dispatcher/models/customer.dart';
import 'package:fleet_dispatcher/stores/customers_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerService {
  static Future<void> getCustomers(BuildContext context) async {
    CustomersStore store = Provider.of<CustomersStore>(context, listen: false);
    final userId = FirebaseAuth.instance.currentUser.uid;
    final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('customers')
        .where('ownerId', isEqualTo: userId)
        .get();
    final customers = querySnapshot.docs
        .map((item) => Customer.fromJson(item.id, item.data()))
        .toList();
    store.saveCustomers(customers);
  }

  static Future<Customer> getCustomer(
    BuildContext context,
    String customerId,
  ) async {
    CustomersStore store = Provider.of<CustomersStore>(context, listen: false);
    final storeCustomer = store.customers[customerId];
    if (storeCustomer != null) {
      return storeCustomer;
    }

    await CustomerService.getCustomers(context);
    return store.customers[customerId];
  }

  static Future<void> createCustomer(
    BuildContext context,
    Customer customer,
  ) async {
    CustomersStore store = Provider.of<CustomersStore>(context, listen: false);
    customer.ownerId = FirebaseAuth.instance.currentUser.uid;
    final customerJson = customer.toJson();

    final docRef = await FirebaseFirestore.instance
        .collection('customers')
        .add(customerJson);
    customer.id = docRef.id;
    store.addCustomer(customer);
  }

  static Future<void> updateCustomer(
    BuildContext context,
    String customerId,
    Customer customer,
  ) async {
    CustomersStore store = Provider.of<CustomersStore>(context, listen: false);
    final customerJson = customer.toJson();

    await FirebaseFirestore.instance
        .collection('customers')
        .doc(customerId)
        .update(customerJson);

    store.addCustomer(Customer.fromJson(customerId, customerJson));
  }
}
