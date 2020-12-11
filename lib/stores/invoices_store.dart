import 'package:fleet_dispatcher/models/invoice.dart';
import 'package:mobx/mobx.dart';

part 'invoices_store.g.dart';

class InvoicesStore = _InvoicesStore with _$InvoicesStore;

abstract class _InvoicesStore with Store {
  @observable
  ObservableMap<String, Invoice> invoices = ObservableMap<String, Invoice>();

  @action
  void addInvoice(Invoice invoice) {
    this.invoices[invoice.id] = invoice;
  }
}
