import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/screens/loads/widgets/load_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';

class LoadsList extends StatefulWidget {
  final List<Load> loads;
  LoadsList({this.loads});

  @override
  _LoadsListState createState() => _LoadsListState();
}

class _LoadsListState extends State<LoadsList> {
  Map<String, List<Load>> loadsByDate;

  void initState() {
    super.initState();
  }

  constructMap() {
    loadsByDate = Map();
    widget.loads.forEach((load) {
      final key = DateFormat('MMM dd yyyy').format(load.pickUpDate);
      if (loadsByDate[key] == null) {
        loadsByDate[key] = [];
      }
      loadsByDate[key].add(load);
    });

    print(loadsByDate);
  }

  @override
  Widget build(BuildContext context) {
    constructMap();

    return CustomScrollView(
      slivers: loadsByDate.keys.map((key) {
        final loads = loadsByDate[key];
        return SliverStickyHeader(
          header: Container(
            height: 30,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              key.toUpperCase(),
              style: Theme.of(context).textTheme.caption.merge(
                    TextStyle(fontWeight: FontWeight.w600),
                  ),
            ),
          ),
          sliver: SliverPadding(
            padding: const EdgeInsets.only(bottom: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: LoadTile(load: loads[i]),
                ),
                childCount: loads.length,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
