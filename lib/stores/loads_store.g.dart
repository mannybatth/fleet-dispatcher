// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loads_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoadsStore on _LoadsStore, Store {
  Computed<List<Load>> _$currentLoadsComputed;

  @override
  List<Load> get currentLoads =>
      (_$currentLoadsComputed ??= Computed<List<Load>>(() => super.currentLoads,
              name: '_LoadsStore.currentLoads'))
          .value;
  Computed<List<Load>> _$deliveredLoadsComputed;

  @override
  List<Load> get deliveredLoads => (_$deliveredLoadsComputed ??=
          Computed<List<Load>>(() => super.deliveredLoads,
              name: '_LoadsStore.deliveredLoads'))
      .value;
  Computed<List<Load>> _$invoicedLoadsComputed;

  @override
  List<Load> get invoicedLoads => (_$invoicedLoadsComputed ??=
          Computed<List<Load>>(() => super.invoicedLoads,
              name: '_LoadsStore.invoicedLoads'))
      .value;
  Computed<List<Load>> _$paidLoadsComputed;

  @override
  List<Load> get paidLoads =>
      (_$paidLoadsComputed ??= Computed<List<Load>>(() => super.paidLoads,
              name: '_LoadsStore.paidLoads'))
          .value;

  final _$loadsAtom = Atom(name: '_LoadsStore.loads');

  @override
  ObservableList<Load> get loads {
    _$loadsAtom.reportRead();
    return super.loads;
  }

  @override
  set loads(ObservableList<Load> value) {
    _$loadsAtom.reportWrite(value, super.loads, () {
      super.loads = value;
    });
  }

  final _$_LoadsStoreActionController = ActionController(name: '_LoadsStore');

  @override
  void saveLoads(List<Load> loads) {
    final _$actionInfo = _$_LoadsStoreActionController.startAction(
        name: '_LoadsStore.saveLoads');
    try {
      return super.saveLoads(loads);
    } finally {
      _$_LoadsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addLoad(Load load) {
    final _$actionInfo =
        _$_LoadsStoreActionController.startAction(name: '_LoadsStore.addLoad');
    try {
      return super.addLoad(load);
    } finally {
      _$_LoadsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loads: ${loads},
currentLoads: ${currentLoads},
deliveredLoads: ${deliveredLoads},
invoicedLoads: ${invoicedLoads},
paidLoads: ${paidLoads}
    ''';
  }
}
