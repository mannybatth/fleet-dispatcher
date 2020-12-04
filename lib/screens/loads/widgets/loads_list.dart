import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/screens/loads/widgets/load_tile.dart';
import 'package:flutter/material.dart';

class LoadsList extends StatelessWidget {
  final List<Load> loads;
  LoadsList({this.loads});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
      itemCount: loads.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: LoadTile(load: loads[index]),
        );
      },
    );
  }
}
