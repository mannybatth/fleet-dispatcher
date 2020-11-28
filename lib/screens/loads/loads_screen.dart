import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/screens/loads/widgets/loads_list.dart';
import 'package:fleet_dispatcher/services/load_service.dart';
import 'package:fleet_dispatcher/stores/loads_store.dart';
import 'package:fleet_dispatcher/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class LoadsScreen extends StatefulWidget {
  @override
  _LoadsScreenState createState() => _LoadsScreenState();
}

class _LoadsScreenState extends State<LoadsScreen> {
  int _selectedIndex = 0;
  LoadsStore store;

  final List<Widget> _titleOptions = <Widget>[
    Text('Current Loads'),
    Text('Delivered Loads'),
    Text('Invoiced Loads'),
    Text('Paid Loads'),
  ];

  void initState() {
    super.initState();
    LoadService.getLoads(context);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    store = Provider.of<LoadsStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: _titleOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Current',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Delivered',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Invoiced',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Paid',
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Observer(
        builder: (_) => [
          LoadsList(loads: store.currentLoads),
          LoadsList(loads: store.deliveredLoads),
          LoadsList(loads: store.invoicedLoads),
          LoadsList(loads: store.paidLoads),
        ].elementAt(_selectedIndex),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.root.push(Routes.loadForm);
        },
        tooltip: 'Add Load',
        child: Icon(Icons.add),
      ),
    );
  }
}
