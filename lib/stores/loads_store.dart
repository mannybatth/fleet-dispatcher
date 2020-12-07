import 'package:fleet_dispatcher/models/load.dart';
import 'package:mobx/mobx.dart';

part 'loads_store.g.dart';

class LoadsStore = _LoadsStore with _$LoadsStore;

abstract class _LoadsStore with Store {
  @observable
  ObservableMap<String, Load> loads = ObservableMap<String, Load>();

  @computed
  List<Load> get loadsList {
    final list = loads.values.toList();
    list.sort((a, b) => b.pickUpDate.compareTo(a.pickUpDate));
    return list;
  }

  @computed
  List<Load> get currentLoads =>
      loadsList.where((load) => load.status == LoadStatus.NONE).toList();

  @computed
  List<Load> get deliveredLoads =>
      loadsList.where((load) => load.status == LoadStatus.DELIVERED).toList();

  @computed
  List<Load> get invoicedLoads =>
      loadsList.where((load) => load.status == LoadStatus.INVOICED).toList();

  @computed
  List<Load> get paidLoads => loadsList
      .where((load) => load.status == LoadStatus.PAYMENT_RECEIVED)
      .toList();

  @action
  void saveLoads(List<Load> loads) {
    final driversMap = Map<String, Load>.fromIterable(
      loads,
      key: (item) => item.id,
      value: (item) => item,
    );
    this.loads = ObservableMap<String, Load>.of(driversMap);
  }

  @action
  void addLoad(Load load) {
    this.loads[load.id] = load;
  }
}
