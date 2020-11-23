import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/widgets/drawer.dart';
import 'package:flutter/material.dart';

class LoadsScreen extends StatefulWidget {
  @override
  _LoadsScreenState createState() => _LoadsScreenState();
}

class _LoadsScreenState extends State<LoadsScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _titleOptions = <Widget>[
    Text('Current Loads'),
    Text('Delivered Loads'),
    Text('Invoiced Loads'),
    Text('Paid Loads'),
  ];

  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text('Current Loads'),
    ),
    Center(
      child: Text('Delivered Loads'),
    ),
    Center(
      child: Text('Invoiced Loads'),
    ),
    Center(
      child: Text('Paid Loads'),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: _widgetOptions.elementAt(_selectedIndex),
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
