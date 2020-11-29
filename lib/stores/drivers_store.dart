import 'package:fleet_dispatcher/models/driver.dart';
import 'package:mobx/mobx.dart';

part 'drivers_store.g.dart';

class DriversStore = _DriversStore with _$DriversStore;

abstract class _DriversStore with Store {
  @observable
  ObservableMap<String, Driver> drivers = ObservableMap<String, Driver>();

  @computed
  List<Driver> get driversList => drivers.values.toList();

  @action
  void saveDrivers(List<Driver> drivers) {
    final driversMap = Map<String, Driver>.fromIterable(
      drivers,
      key: (item) => item.id,
      value: (item) => item,
    );
    this.drivers = ObservableMap<String, Driver>.of(driversMap);
  }

  @action
  void addDriver(Driver driver) {
    this.drivers[driver.id] = driver;
  }
}
