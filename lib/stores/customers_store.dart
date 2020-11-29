import 'package:fleet_dispatcher/models/customer.dart';
import 'package:mobx/mobx.dart';

part 'customers_store.g.dart';

class CustomersStore = _CustomersStore with _$CustomersStore;

abstract class _CustomersStore with Store {
  @observable
  ObservableMap<String, Customer> customers = ObservableMap<String, Customer>();

  @computed
  List<Customer> get customersList => customers.values.toList();

  @action
  void saveCustomers(List<Customer> customers) {
    final customersMap = Map<String, Customer>.fromIterable(
      customers,
      key: (item) => item.id,
      value: (item) => item,
    );
    this.customers = ObservableMap<String, Customer>.of(customersMap);
  }

  @action
  void addCustomer(Customer customer) {
    this.customers[customer.id] = customer;
  }
}
