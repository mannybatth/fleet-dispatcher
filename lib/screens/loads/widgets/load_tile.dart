import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LoadTile extends StatelessWidget {
  final Load load;

  LoadTile({this.load});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ExtendedNavigator.root.push(
          Routes.loadDetailScreen,
          arguments: LoadDetailScreenArguments(loadId: load.id),
        );
      },
      child: ListTile(
        mouseCursor: SystemMouseCursors.click,
        title: Text(load.id),
      ),
    );
  }
}
