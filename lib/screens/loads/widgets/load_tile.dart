import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/routes/routes.gr.dart';
import 'package:fleet_dispatcher/widgets/badge.dart';
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
      child: Ink(
        height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
            vertical: BorderSide.none,
            horizontal: BorderSide(
              width: 1.0,
              style: BorderStyle.solid,
              color: Colors.grey.shade300,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1.0,
                    style: BorderStyle.solid,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(load.customer.title,
                      style: Theme.of(context).textTheme.subtitle2.merge(
                            TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade700,
                            ),
                          )),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      height: 25,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 35,
                          bottom: 5,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                              load.getLoadRefText().toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.caption.merge(
                                    TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                            )),
                            SizedBox(width: 10),
                            Badge(
                              text: load.getLoadStatusText(),
                              color: load.getLoadStatusColor(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey.shade800,
                              ),
                              Container(
                                width: 2,
                                height: 35,
                                foregroundDecoration:
                                    ShapeDecoration.fromBoxDecoration(
                                  BoxDecoration(color: Colors.grey.shade300),
                                ),
                              ),
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.grey.shade800,
                              ),
                            ],
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${load.pickUpLocation.city}, ${load.pickUpLocation.state}',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .merge(
                                        TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '${load.pickUpLocation.street}',
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      Theme.of(context).textTheme.caption.merge(
                                            TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                ),
                                // Text(
                                //   '${DateFormat('MMM dd').format(load.pickUpDate)}',
                                //   style: Theme.of(context).textTheme.caption,
                                // ),
                                SizedBox(height: 20),
                                Text(
                                  '${load.deliveryLocation.city}, ${load.deliveryLocation.state}',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .merge(
                                        TextStyle(
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '${load.deliveryLocation.street}',
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                      Theme.of(context).textTheme.caption.merge(
                                            TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                ),
                                // Text(
                                //   '${DateFormat('MMM dd').format(load.deliveryDate)}',
                                //   style: Theme.of(context).textTheme.caption,
                                // ),
                                // Text(
                                //   load.customer?.title,
                                //   style: Theme.of(context).textTheme.subtitle1,
                                // )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
