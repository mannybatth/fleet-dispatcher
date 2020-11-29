import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/services/company_service.dart';
import 'package:fleet_dispatcher/stores/company_store.dart';
import 'package:fleet_dispatcher/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  CompanyStore store;

  void initState() {
    super.initState();
    CompanyService.getCompany(context);
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<CompanyStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Company'),
      ),
      drawer: AppDrawer(),
      body: Observer(
        builder: (_) => ListView(
          children: [
            ListTile(
              subtitle: Text('Title'),
              title: Text(this.store.company?.title ?? ''),
            ),
            ListTile(
              subtitle: Text('Email'),
              title: Text(this.store.company?.email ?? ''),
            ),
            ListTile(
              subtitle: Text('Address'),
              title: Text(this.store.company?.address ?? ''),
            ),
            ListTile(
              subtitle: Text('City'),
              title: Text(this.store.company?.city ?? ''),
            ),
            ListTile(
              subtitle: Text('State'),
              title: Text(this.store.company?.state ?? ''),
            ),
            ListTile(
              subtitle: Text('Zip Code'),
              title: Text(this.store.company?.zipCode ?? ''),
            ),
            ListTile(
              subtitle: Text('Phone'),
              title: Text(this.store.company?.phone ?? ''),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.root.push(
            Routes.companyForm,
            arguments: CompanyFormArguments(company: store.company),
          );
        },
        tooltip: 'Edit Company',
        child: Icon(Icons.edit),
      ),
    );
  }
}
