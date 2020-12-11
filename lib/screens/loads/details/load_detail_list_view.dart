import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/utils/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class LoadDetailListView extends StatelessWidget {
  final Load load;
  LoadDetailListView({this.load});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'CUSTOMER',
                style: Theme.of(context).textTheme.caption.merge(
                      TextStyle(fontWeight: FontWeight.w600),
                    ),
              ),
            ],
          ),
        ),
        ColoredBox(
          color: Colors.white,
          child: Material(
            child: InkWell(
              hoverColor: Colors.transparent,
              onTap: () {
                ExtendedNavigator.root.push(
                  Routes.customerDetailScreen,
                  arguments: CustomerDetailScreenArguments(
                      customerId: this.load.customer.id),
                );
              },
              child: ListTile(
                mouseCursor: SystemMouseCursors.click,
                title: Text(this.load.customer.title),
                trailing: Icon(Icons.arrow_forward_ios, size: 18),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PICK UP',
                style: Theme.of(context).textTheme.caption.merge(
                      TextStyle(fontWeight: FontWeight.w600),
                    ),
              ),
              Text(
                DateFormat('MMM dd yyyy').format(load.pickUpDate).toUpperCase(),
                style: Theme.of(context).textTheme.caption.merge(
                      TextStyle(fontWeight: FontWeight.w600),
                    ),
              )
            ],
          ),
        ),
        ListTile(
          subtitle: Text('Shipper'),
          title: Text(this.load.shipper),
          tileColor: Colors.white,
        ),
        ListTile(
          title: Text(this.load.pickUpLocation.street),
          subtitle: Text(
              '${this.load.pickUpLocation.city}, ${this.load.pickUpLocation.state} ${this.load.pickUpLocation.zipCode}'),
          tileColor: Colors.white,
          trailing: Material(
            child: IconButton(
              icon: Icon(Icons.copy),
              onPressed: () {
                copyToClipboard(context,
                    '${this.load.pickUpLocation.street} ${this.load.pickUpLocation.city}, ${this.load.pickUpLocation.state} ${this.load.pickUpLocation.zipCode}');
              },
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DROP OFF',
                style: Theme.of(context).textTheme.caption.merge(
                      TextStyle(fontWeight: FontWeight.w600),
                    ),
              ),
              Text(
                DateFormat('MMM dd yyyy')
                    .format(load.deliveryDate)
                    .toUpperCase(),
                style: Theme.of(context).textTheme.caption.merge(
                      TextStyle(fontWeight: FontWeight.w600),
                    ),
              )
            ],
          ),
        ),
        ListTile(
          subtitle: Text('Consignee'),
          title: Text(this.load.consignee),
          tileColor: Colors.white,
        ),
        ListTile(
          title: Text(this.load.deliveryLocation.street),
          subtitle: Text(
              '${this.load.deliveryLocation.city}, ${this.load.deliveryLocation.state} ${this.load.deliveryLocation.zipCode}'),
          tileColor: Colors.white,
          trailing: Material(
            child: IconButton(
              icon: Icon(Icons.copy),
              onPressed: () {
                copyToClipboard(context,
                    '${this.load.deliveryLocation.street} ${this.load.deliveryLocation.city}, ${this.load.deliveryLocation.state} ${this.load.deliveryLocation.zipCode}');
              },
            ),
          ),
        ),
        SizedBox(height: 20),
        if (this.load.poNum.isNotEmpty)
          ListTile(
            title: Text(this.load.poNum),
            subtitle: Text('PO #'),
            trailing: Material(
              child: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  copyToClipboard(context, this.load.poNum);
                },
              ),
            ),
            tileColor: Colors.white,
          ),
        if (this.load.loadNum.isNotEmpty)
          ListTile(
            title: Text(this.load.loadNum),
            subtitle: Text('Load #'),
            trailing: Material(
              child: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  copyToClipboard(context, this.load.loadNum);
                },
              ),
            ),
            tileColor: Colors.white,
          ),
        if (this.load.refNum.isNotEmpty)
          ListTile(
            title: Text(this.load.refNum),
            subtitle: Text('Ref #'),
            trailing: Material(
              child: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  copyToClipboard(context, this.load.refNum);
                },
              ),
            ),
            tileColor: Colors.white,
          ),
        if (this.load.orderNum.isNotEmpty)
          ListTile(
            title: Text(this.load.orderNum),
            subtitle: Text('Order #'),
            trailing: Material(
              child: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  copyToClipboard(context, this.load.orderNum);
                },
              ),
            ),
            tileColor: Colors.white,
          ),
        ListTile(
          title: Text('Rate'),
          trailing: Text(
              '\$${NumberFormat("#,##0.00", "en_US").format(this.load.rate)}'),
          tileColor: Colors.white,
        ),
        ListTile(
          title: Text('Status'),
          trailing: Text(this.load.getLoadStatusText()),
          tileColor: Colors.white,
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DRIVER',
                style: Theme.of(context).textTheme.caption.merge(
                      TextStyle(fontWeight: FontWeight.w600),
                    ),
              ),
            ],
          ),
        ),
        ColoredBox(
          color: Colors.white,
          child: Material(
            child: InkWell(
              hoverColor: Colors.transparent,
              onTap: () {
                ExtendedNavigator.root.push(
                  Routes.driverDetailScreen,
                  arguments: DriverDetailScreenArguments(
                      driverId: this.load.driver.id),
                );
              },
              child: ListTile(
                mouseCursor: SystemMouseCursors.click,
                title: Text(this.load.driver.fullName),
                trailing: Icon(Icons.arrow_forward_ios, size: 18),
              ),
            ),
          ),
        ),
        SizedBox(height: 150),
      ],
    );
  }
}
