// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CompanyStore on _CompanyStore, Store {
  final _$companyAtom = Atom(name: '_CompanyStore.company');

  @override
  Company get company {
    _$companyAtom.reportRead();
    return super.company;
  }

  @override
  set company(Company value) {
    _$companyAtom.reportWrite(value, super.company, () {
      super.company = value;
    });
  }

  final _$_CompanyStoreActionController =
      ActionController(name: '_CompanyStore');

  @override
  void saveCompany(Company company) {
    final _$actionInfo = _$_CompanyStoreActionController.startAction(
        name: '_CompanyStore.saveCompany');
    try {
      return super.saveCompany(company);
    } finally {
      _$_CompanyStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
company: ${company}
    ''';
  }
}
