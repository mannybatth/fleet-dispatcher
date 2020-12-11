import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

class LoadSheetContent extends StatelessWidget {
  _onCreateInvoicePressed() {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            RaisedButton(
              child: Text(
                'Create Invoice',
                style: TextStyle(fontSize: 25),
              ),
              onPressed: _onCreateInvoicePressed,
            ),
          ],
        ),
      ),
    );
  }
}

class LoadSheetGrabSection extends StatelessWidget {
  final SnappingSheetController controller;
  LoadSheetGrabSection({this.controller});

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
              height: 8.0,
              margin: EdgeInsets.only(top: 15.0),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
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
