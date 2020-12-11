// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InvoicesStore on _InvoicesStore, Store {
  final _$invoicesAtom = Atom(name: '_InvoicesStore.invoices');

  @override
  ObservableMap<String, Invoice> get invoices {
    _$invoicesAtom.reportRead();
    return super.invoices;
  }

  @override
  set invoices(ObservableMap<String, Invoice> value) {
    _$invoicesAtom.reportWrite(value, super.invoices, () {
      super.invoices = value;
    });
  }

  final _$_InvoicesStoreActionController =
      ActionController(name: '_InvoicesStore');

  @override
  void addInvoice(Invoice invoice) {
    final _$actionInfo = _$_InvoicesStoreActionController.startAction(
        name: '_InvoicesStore.addInvoice');
    try {
      return super.addInvoice(invoice);
    } finally {
      _$_InvoicesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
invoices: ${invoices}
    ''';
  }
}
