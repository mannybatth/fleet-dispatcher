import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/customer.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomerTile extends StatelessWidget {
  final Customer customer;

  CustomerTile({this.customer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ExtendedNavigator.root.push(
          Routes.customerDetailScreen,
          arguments: CustomerDetailScreenArguments(customerId: customer.id),
        );
      },
      child: ListTile(
        mouseCursor: SystemMouseCursors.click,
        title: Text(customer.title),
      ),
    );
  }
}
