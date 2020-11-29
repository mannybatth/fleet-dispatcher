import 'package:fleet_dispatcher/models/load.dart';
import 'package:mobx/mobx.dart';

part 'loads_store.g.dart';

class LoadsStore = _LoadsStore with _$LoadsStore;

abstract class _LoadsStore with Store {
  @observable
  ObservableList<Load> loads = ObservableList<Load>();

  @computed
  List<Load> get currentLoads =>
      loads.where((load) => load.status == LoadStatus.NONE).toList();

  @computed
  List<Load> get deliveredLoads =>
      loads.where((load) => load.status == LoadStatus.DELIVERED).toList();

  @computed
  List<Load> get invoicedLoads =>
      loads.where((load) => load.status == LoadStatus.INVOICED).toList();

  @computed
  List<Load> get paidLoads => loads
      .where((load) => load.status == LoadStatus.PAYMENT_RECEIVED)
      .toList();

  @action
  void saveLoads(List<Load> loads) {
    this.loads = ObservableList<Load>.of(loads);
  }

  @action
  void addLoad(Load load) {
    this.loads.insert(0, load);
  }
}
