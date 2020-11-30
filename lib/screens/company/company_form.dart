import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/address.dart';
import 'package:fleet_dispatcher/models/company.dart';
import 'package:fleet_dispatcher/services/company_service.dart';
import 'package:flutter/material.dart';

class CompanyForm extends StatefulWidget {
  final Company company;
  CompanyForm({Key key, this.company}) : super(key: key);

  @override
  _CompanyFormState createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  final _titleController = TextEditingController();
  final _emailController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _phoneController = TextEditingController();

  void initState() {
    super.initState();

    if (widget.company != null) {
      _titleController.text = widget.company.title;
      _emailController.text = widget.company.email;
      _streetController.text = widget.company.address.street;
      _cityController.text = widget.company.address.city;
      _stateController.text = widget.company.address.state;
      _zipCodeController.text = widget.company.address.zipCode;
      _phoneController.text = widget.company.phone;
    }
  }

  void dispose() {
    _titleController.dispose();
    _emailController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void onActionClick() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });

      Company company = Company(
        title: _titleController.text.trim(),
        email: _emailController.text.trim(),
        address: Address(
          street: _streetController.text.trim(),
          city: _cityController.text.trim(),
          state: _stateController.text.trim(),
          zipCode: _zipCodeController.text.trim(),
        ),
        phone: _phoneController.text.trim(),
      );

      await CompanyService.updateCompany(context, company);

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
          'Edit Company',
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
                : IconButton(
                    iconSize: 50,
                    icon: Text('SAVE'),
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
                  controller: _titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Title is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _streetController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    labelText: 'City',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _stateController,
                  decoration: InputDecoration(
                    labelText: 'State',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _zipCodeController,
                  decoration: InputDecoration(
                    labelText: 'Zip Code',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
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
