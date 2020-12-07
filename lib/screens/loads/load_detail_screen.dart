import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/stores/loads_store.dart';
import 'package:fleet_dispatcher/utils/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class LoadDetailScreen extends StatefulWidget {
  final String loadId;
  LoadDetailScreen({Key key, this.loadId}) : super(key: key);

  @override
  _LoadDetailScreenState createState() => _LoadDetailScreenState();
}

class _LoadDetailScreenState extends State<LoadDetailScreen> {
  Load load;
  LoadsStore store;
  final _controller = SnappingSheetController();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<LoadsStore>(context);

    autorun((_) {
      setState(() {
        this.load = store.loads[widget.loadId];
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Load Details'),
      ),
      body: SnappingSheet(
        sheetAbove: SnappingSheetContent(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment(0.90, 1.0),
              child: FloatingActionButton(
                onPressed: () {
                  ExtendedNavigator.root.push(
                    Routes.loadForm,
                    arguments: LoadFormArguments(load: load),
                  );
                },
                tooltip: 'Edit Load',
                child: Icon(Icons.edit),
              ),
            ),
          ),
        ),
        snappingSheetController: _controller,
        snapPositions: const [
          SnapPosition(
            positionPixel: 0.0,
            snappingCurve: Curves.elasticOut,
            snappingDuration: Duration(milliseconds: 750),
          ),
          SnapPosition(positionFactor: 0.75),
        ],
        grabbingHeight: MediaQuery.of(context).padding.bottom + 50,
        grabbing: GrabSection(controller: _controller),
        sheetBelow: SnappingSheetContent(child: SheetContent()),
        child: ListView(
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
                    DateFormat('MMM dd yyyy')
                        .format(load.pickUpDate)
                        .toUpperCase(),
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
        ),
      ),
    );
  }
}

class SheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        padding: EdgeInsets.all(20.0),
        itemCount: 50,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey[300], width: 1.0))),
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('List item $index'),
            ),
          );
        },
      ),
    );
  }
}

class GrabSection extends StatelessWidget {
  final SnappingSheetController controller;
  GrabSection({this.controller});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        if (controller.snapPositions.last != controller.currentSnapPosition)
          {controller.snapToPosition(controller.snapPositions.last)}
        else
          {controller.snapToPosition(controller.snapPositions.first)}
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20.0,
              color: Colors.black.withOpacity(0.2),
            )
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 100.0,
              height: 10.0,
              margin: EdgeInsets.only(top: 15.0),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
            ),
            Container(
              height: 1.0,
              margin: EdgeInsets.only(left: 20, right: 20),
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
