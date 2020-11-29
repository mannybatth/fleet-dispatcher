import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/customer.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/stores/customers_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class CustomerDetailScreen extends StatefulWidget {
  final String customerId;
  CustomerDetailScreen({Key key, this.customerId}) : super(key: key);

  @override
  _CustomerDetailScreenState createState() => _CustomerDetailScreenState();
}

class _CustomerDetailScreenState extends State<CustomerDetailScreen> {
  Customer customer;
  CustomersStore store;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<CustomersStore>(context);

    autorun((_) {
      setState(() {
        this.customer = store.customers[widget.customerId];
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(this.customer.title),
      ),
      body: ListView(
        children: [
          ListTile(
            subtitle: Text('Title'),
            title: Text(this.customer.title),
          ),
          ListTile(
            subtitle: Text('Address'),
            title: Text(this.customer.address),
          ),
          ListTile(
            subtitle: Text('City'),
            title: Text(this.customer.city),
          ),
          ListTile(
            subtitle: Text('State'),
            title: Text(this.customer.state),
          ),
          ListTile(
            subtitle: Text('Zip Code'),
            title: Text(this.customer.zipCode),
          ),
          ListTile(
            subtitle: Text('Phone'),
            title: Text(this.customer.phone),
          ),
          ListTile(
            subtitle: Text('Invoice Email'),
            title: Text(this.customer.invoiceEmail),
          ),
          SizedBox(height: 100)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.root.push(
            Routes.customerForm,
            arguments: CustomerFormArguments(customer: customer),
          );
        },
        tooltip: 'Edit Customer',
        child: Icon(Icons.edit),
      ),
    );
  }
}
