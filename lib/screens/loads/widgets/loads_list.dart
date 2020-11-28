import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/screens/loads/widgets/load_tile.dart';
import 'package:flutter/material.dart';

class LoadsList extends StatelessWidget {
  List<Load> loads;
  LoadsList({this.loads});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: loads.length,
      itemBuilder: (context, index) {
        return LoadTile(load: loads[index]);
      },
    );
  }
}
