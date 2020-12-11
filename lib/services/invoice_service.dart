import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleet_dispatcher/models/invoice.dart';
import 'package:fleet_dispatcher/services/company_service.dart';
import 'package:fleet_dispatcher/services/load_service.dart';
import 'package:fleet_dispatcher/stores/invoices_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvoiceService {
  static Future<Invoice> getInvoice(
    BuildContext context,
    String invoiceId,
  ) async {
    InvoicesStore store = Provider.of<InvoicesStore>(context, listen: false);
    final storeInvoice = store.invoices[invoiceId];
    if (storeInvoice != null) {
      return storeInvoice;
    }

    final DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('invoices')
        .doc(invoiceId)
        .get();

    if (docSnapshot.exists) {
      Invoice invoice = Invoice.fromJson(docSnapshot.id, docSnapshot.data());
      store.addInvoice(invoice);
      return invoice;
    }
    return null;
  }

  static Future<Invoice> createInvoice(
    BuildContext context,
    Invoice invoice,
    String loadId,
  ) async {
    InvoicesStore store = Provider.of<InvoicesStore>(context, listen: false);
    invoice.loadId = loadId;
    invoice.ownerId = FirebaseAuth.instance.currentUser.uid;
    invoice.invoiceNum = await CompanyService.getNextInvoiceNum(context);

    CompanyService.saveLastUsedInvoiceNum(context, invoice.invoiceNum);

    final invoiceJson = invoice.toJson();

    final docRef = await FirebaseFirestore.instance
        .collection('invoices')
        .add(invoiceJson);
    invoice.id = docRef.id;
    store.addInvoice(invoice);

    await LoadService.updateLoadInvoiceId(context, loadId, invoice.id);

    return invoice;
  }

  static Future<void> updateInvoice(
    BuildContext context,
    String invoiceId,
    Invoice invoice,
  ) async {
    InvoicesStore store = Provider.of<InvoicesStore>(context, listen: false);
    final invoiceJson = invoice.toJson();

    await FirebaseFirestore.instance
        .collection('invoices')
        .doc(invoiceId)
        .set(invoiceJson);

    store.addInvoice(Invoice.fromJson(invoiceId, invoiceJson));
  }
}
