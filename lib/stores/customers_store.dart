import 'package:fleet_dispatcher/models/customer.dart';
import 'package:mobx/mobx.dart';

part 'customers_store.g.dart';

class CustomersStore = _CustomersStore with _$CustomersStore;

abstract class _CustomersStore with Store {
  @observable
  List<Customer> customers = [];
}
