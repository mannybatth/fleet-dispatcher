import 'package:flutter/material.dart';

class LoadForm extends StatefulWidget {
  @override
  _LoadFormState createState() => _LoadFormState();
}

class _LoadFormState extends State<LoadForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load Form'),
      ),
      body: Center(
        child: Text('form here'),
      ),
    );
  }
}
