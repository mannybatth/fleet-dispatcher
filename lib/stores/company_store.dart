import 'package:fleet_dispatcher/models/company.dart';
import 'package:mobx/mobx.dart';

part 'company_store.g.dart';

class CompanyStore = _CompanyStore with _$CompanyStore;

abstract class _CompanyStore with Store {
  @observable
  Company company;

  @action
  void saveCompany(Company company) {
    this.company = company;
  }
}
