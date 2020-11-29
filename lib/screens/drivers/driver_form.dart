import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/driver.dart';
import 'package:fleet_dispatcher/services/driver_service.dart';
import 'package:flutter/material.dart';

class DriverForm extends StatefulWidget {
  final Driver driver;
  DriverForm({Key key, this.driver}) : super(key: key);

  @override
  _DriverFormState createState() => _DriverFormState();
}

class _DriverFormState extends State<DriverForm> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _truckNumController = TextEditingController();
  final _trailerNumController = TextEditingController();

  void initState() {
    super.initState();

    if (widget.driver != null) {
      _firstNameController.text = widget.driver.firstName;
      _lastNameController.text = widget.driver.lastName;
      _phoneController.text = widget.driver.phone;
      _truckNumController.text = widget.driver.truckNum;
      _trailerNumController.text = widget.driver.trailerNum;
    }
  }

  void onActionClick() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });

      Driver driver = Driver(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        phone: _phoneController.text.trim(),
        truckNum: _truckNumController.text.trim(),
        trailerNum: _trailerNumController.text.trim(),
      );

      if (widget.driver != null) {
        await DriverService.updateDriver(
          context,
          widget.driver.id,
          driver,
        );
      } else {
        await DriverService.createDriver(
          context,
          driver,
        );
      }

      ExtendedNavigator.root.pop();

      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.driver != null ? 'Edit Driver' : 'New Driver',
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
            child: _loading
                ? Container(
                    width: 55,
                    child: Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(),
                        height: 25.0,
                        width: 25.0,
                      ),
                    ),
                  )
                : TextButton(
                    child: Text(this.widget.driver != null ? 'SAVE' : 'ADD'),
                    onPressed: onActionClick,
                  ),
          ),
        ],
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'First Name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Last Name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _truckNumController,
                  decoration: InputDecoration(
                    labelText: 'Truck #',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _trailerNumController,
                  decoration: InputDecoration(
                    labelText: 'Trailer #',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
