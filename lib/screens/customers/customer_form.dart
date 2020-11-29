import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/customer.dart';
import 'package:fleet_dispatcher/services/customer_service.dart';
import 'package:flutter/material.dart';

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
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _invoiceEmailController = TextEditingController();

  void initState() {
    super.initState();

    if (widget.customer != null) {
      _titleController.text = widget.customer.title;
      _addressController.text = widget.customer.address;
      _cityController.text = widget.customer.city;
      _stateController.text = widget.customer.state;
      _zipCodeController.text = widget.customer.zipCode;
      _phoneController.text = widget.customer.phone;
      _invoiceEmailController.text = widget.customer.invoiceEmail;
    }
  }

  void onActionClick() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });

      Map<String, String> form = {
        "title": _titleController.text.trim(),
        "address": _addressController.text.trim(),
        "city": _cityController.text.trim(),
        "state": _stateController.text.trim(),
        "zipCode": _zipCodeController.text.trim(),
        "phone": _phoneController.text.trim(),
        "invoiceEmail": _invoiceEmailController.text.trim()
      };

      if (widget.customer != null) {
        Map<String, String> customerJson = {
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
                    child: Text(this.widget.customer != null ? 'SAVE' : 'ADD'),
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
                  controller: _addressController,
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
