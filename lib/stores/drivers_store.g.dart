// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drivers_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DriversStore on _DriversStore, Store {
  Computed<List<Driver>> _$driversListComputed;

  @override
  List<Driver> get driversList =>
      (_$driversListComputed ??= Computed<List<Driver>>(() => super.driversList,
              name: '_DriversStore.driversList'))
          .value;

  final _$driversAtom = Atom(name: '_DriversStore.drivers');

  @override
  ObservableMap<String, Driver> get drivers {
    _$driversAtom.reportRead();
    return super.drivers;
  }

  @override
  set drivers(ObservableMap<String, Driver> value) {
    _$driversAtom.reportWrite(value, super.drivers, () {
      super.drivers = value;
    });
  }

  final _$_DriversStoreActionController =
      ActionController(name: '_DriversStore');

  @override
  void saveDrivers(List<Driver> drivers) {
    final _$actionInfo = _$_DriversStoreActionController.startAction(
        name: '_DriversStore.saveDrivers');
    try {
      return super.saveDrivers(drivers);
    } finally {
      _$_DriversStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addDriver(Driver driver) {
    final _$actionInfo = _$_DriversStoreActionController.startAction(
        name: '_DriversStore.addDriver');
    try {
      return super.addDriver(driver);
    } finally {
      _$_DriversStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
drivers: ${drivers},
driversList: ${driversList}
    ''';
  }
}
