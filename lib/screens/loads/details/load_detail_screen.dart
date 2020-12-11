import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/screens/loads/details/load_detail_list_view.dart';
import 'package:fleet_dispatcher/screens/loads/details/load_sheet.dart';
import 'package:fleet_dispatcher/stores/loads_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
        grabbing: LoadSheetGrabSection(controller: _controller),
        sheetBelow: SnappingSheetContent(
          child: LoadSheetContent(),
          heightBehavior: SnappingSheetHeight.fixed(),
        ),
        child: LoadDetailListView(
          load: this.load,
        ),
      ),
    );
  }
}
