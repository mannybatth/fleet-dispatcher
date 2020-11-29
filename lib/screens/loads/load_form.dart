import 'package:fleet_dispatcher/models/load.dart';
import 'package:flutter/material.dart';

class LoadForm extends StatelessWidget {
  final Load load;
  LoadForm({this.load});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.load != null ? this.load.id : 'New Load'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter your username',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
