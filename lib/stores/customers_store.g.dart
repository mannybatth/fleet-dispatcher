// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CustomersStore on _CustomersStore, Store {
  Computed<List<Customer>> _$customersListComputed;

  @override
  List<Customer> get customersList => (_$customersListComputed ??=
          Computed<List<Customer>>(() => super.customersList,
              name: '_CustomersStore.customersList'))
      .value;

  final _$customersAtom = Atom(name: '_CustomersStore.customers');

  @override
  ObservableMap<String, Customer> get customers {
    _$customersAtom.reportRead();
    return super.customers;
  }

  @override
  set customers(ObservableMap<String, Customer> value) {
    _$customersAtom.reportWrite(value, super.customers, () {
      super.customers = value;
    });
  }

  final _$_CustomersStoreActionController =
      ActionController(name: '_CustomersStore');

  @override
  void saveCustomers(List<Customer> customers) {
    final _$actionInfo = _$_CustomersStoreActionController.startAction(
        name: '_CustomersStore.saveCustomers');
    try {
      return super.saveCustomers(customers);
    } finally {
      _$_CustomersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCustomer(Customer customer) {
    final _$actionInfo = _$_CustomersStoreActionController.startAction(
        name: '_CustomersStore.addCustomer');
    try {
      return super.addCustomer(customer);
    } finally {
      _$_CustomersStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
customers: ${customers},
customersList: ${customersList}
    ''';
  }
}
