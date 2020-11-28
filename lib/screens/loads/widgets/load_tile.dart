import 'package:fleet_dispatcher/models/load.dart';
import 'package:flutter/material.dart';

class LoadTile extends StatelessWidget {
  final Load load;

  LoadTile({this.load});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(load.id),
    );
  }
}
