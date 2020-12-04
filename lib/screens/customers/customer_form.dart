import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/customer.dart';
import 'package:fleet_dispatcher/services/customer_service.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class CustomerForm extends StatefulWidget {
  final Customer customer;
  CustomerForm({Key key, this.customer}) : super(key: key);

  @override
  _CustomerFormState createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  final _titleController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _invoiceEmailController = TextEditingController();

  void initState() {
    super.initState();

    if (widget.customer != null) {
      _titleController.text = widget.customer.title;
      _streetController.text = widget.customer.address.street;
      _cityController.text = widget.customer.address.city;
      _stateController.text = widget.customer.address.state;
      _zipCodeController.text = widget.customer.address.zipCode;
      _phoneController.text = widget.customer.phone;
      _invoiceEmailController.text = widget.customer.invoiceEmail;
    }
  }

  void dispose() {
    _titleController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _phoneController.dispose();
    _invoiceEmailController.dispose();
    super.dispose();
  }

  void onFormatClick() {
    _titleController.text = _titleController.text.titleCase;
    _streetController.text = _streetController.text.titleCase;
    _cityController.text = _cityController.text.titleCase;
  }

  void onActionClick() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });

      Map<String, dynamic> form = {
        "title": _titleController.text.trim(),
        "address": {
          "street": _streetController.text.trim(),
          "city": _cityController.text.trim(),
          "state": _stateController.text.trim(),
          "zipCode": _zipCodeController.text.trim(),
        },
        "phone": _phoneController.text.trim(),
        "invoiceEmail": _invoiceEmailController.text.trim()
      };

      if (widget.customer != null) {
        Map<String, dynamic> customerJson = {
          ...widget.customer.toJson(),
          ...form,
        };

        Customer customer = Customer.fromJson(widget.customer.id, customerJson);

        await CustomerService.updateCustomer(
          context,
          widget.customer.id,
          customer,
        );
      } else {
        Customer customer = Customer.fromJson(null, form);

        await CustomerService.createCustomer(
          context,
          customer,
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
          this.widget.customer != null ? 'Edit Customer' : 'New Customer',
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10, top: 5, bottom: 5),
            child: Row(
              children: [
                IconButton(
                  iconSize: 60,
                  icon: Text('FORMAT'),
                  onPressed: onFormatClick,
                ),
                _loading
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
                        icon:
                            Text(this.widget.customer != null ? 'SAVE' : 'ADD'),
                        onPressed: onActionClick,
                      ),
              ],
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
                SizedBox(height: 10),
                TextFormField(
                  controller: _invoiceEmailController,
                  decoration: InputDecoration(
                    labelText: 'Invoice Email',
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
