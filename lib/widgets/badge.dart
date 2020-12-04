import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  final String text;
  final Color color;
  Badge({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color ?? Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.caption.merge(
              TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
      ),
    );
  }
}
