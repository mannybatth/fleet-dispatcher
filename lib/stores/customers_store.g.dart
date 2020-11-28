// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomersStore on _CustomersStore, Store {
  final _$customersAtom = Atom(name: '_CustomersStore.customers');

  @override
  List<Customer> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(List<Customer> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  @override
  String toString() {
    return '''
customers: ${customers}
    ''';
  }
}
