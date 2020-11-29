import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/screens/customers/widgets/customer_tile.dart';
import 'package:fleet_dispatcher/services/customer_service.dart';
import 'package:fleet_dispatcher/stores/customers_store.dart';
import 'package:fleet_dispatcher/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CustomersScreen extends StatefulWidget {
  @override
  _CustomersScreenState createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  CustomersStore store;

  void initState() {
    super.initState();
    CustomerService.getCustomers(context);
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<CustomersStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Customers'),
      ),
      drawer: AppDrawer(),
      body: Observer(
        builder: (_) => ListView.builder(
          itemCount: store.customersList.length,
          itemBuilder: (context, index) {
            return CustomerTile(customer: store.customersList[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.root.push(Routes.customerForm);
        },
        tooltip: 'Add Customer',
        child: Icon(Icons.add),
      ),
    );
  }
}
