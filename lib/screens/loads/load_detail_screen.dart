import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/stores/loads_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class LoadDetailScreen extends StatefulWidget {
  final String loadId;
  LoadDetailScreen({Key key, this.loadId}) : super(key: key);

  @override
  _LoadDetailScreenState createState() => _LoadDetailScreenState();
}

class _LoadDetailScreenState extends State<LoadDetailScreen> {
  Load load;
  LoadsStore store;

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
        title: Text(this.load.id),
      ),
      body: ListView(
        children: [
          ListTile(
            subtitle: Text('Shipper'),
            title: Text(this.load.shipper),
          ),
          SizedBox(height: 100)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.root.push(
            Routes.loadForm,
            arguments: LoadFormArguments(load: load),
          );
        },
        tooltip: 'Edit Load',
        child: Icon(Icons.edit),
      ),
    );
  }
}
