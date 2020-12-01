import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/customer.dart';
import 'package:fleet_dispatcher/models/driver.dart';
import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/services/load_service.dart';
import 'package:fleet_dispatcher/stores/customers_store.dart';
import 'package:fleet_dispatcher/stores/drivers_store.dart';
import 'package:fleet_dispatcher/utils/s2_modal_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';
import 'package:recase/recase.dart';

class LoadForm extends StatefulWidget {
  final Load load;
  LoadForm({Key key, this.load}) : super(key: key);

  @override
  _LoadFormState createState() => _LoadFormState();
}

class _LoadFormState extends State<LoadForm> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  CustomersStore customersStore;
  DriversStore driversStore;

  Customer selectedCustomer;
  List<S2Choice<Customer>> customerOptions = [];

  Driver selectedDriver;
  List<S2Choice<Driver>> driverOptions = [];

  DateTime pickUpDate;
  DateTime deliveryDate;

  final _shipperController = TextEditingController();
  final _pickUpStreetController = TextEditingController();
  final _pickUpCityController = TextEditingController();
  final _pickUpStateController = TextEditingController();
  final _pickUpZipCodeController = TextEditingController();
  final _pickUpDateController = TextEditingController();
  final _consigneeController = TextEditingController();
  final _deliveryStreetController = TextEditingController();
  final _deliveryCityController = TextEditingController();
  final _deliveryStateController = TextEditingController();
  final _deliveryZipCodeController = TextEditingController();
  final _deliveryDateController = TextEditingController();
  final _rateController = MoneyMaskedTextController(
    decimalSeparator: '.',
    thousandSeparator: ',',
    leftSymbol: '\$ ',
  );
  final _poNumController = TextEditingController();
  final _loadNumController = TextEditingController();
  final _refNumController = TextEditingController();
  final _orderNumController = TextEditingController();

  void initState() {
    super.initState();

    if (widget.load != null) {
      _shipperController.text = widget.load.shipper;
      _pickUpStreetController.text = widget.load.pickUpLocation.street;
      _pickUpCityController.text = widget.load.pickUpLocation.city;
      _pickUpStateController.text = widget.load.pickUpLocation.state;
      _pickUpZipCodeController.text = widget.load.pickUpLocation.zipCode;
      _pickUpDateController.text =
          DateFormat('MM-dd-yyyy').format(widget.load.pickUpDate);
      _consigneeController.text = widget.load.consignee;
      _deliveryStreetController.text = widget.load.deliveryLocation.street;
      _deliveryCityController.text = widget.load.deliveryLocation.city;
      _deliveryStateController.text = widget.load.deliveryLocation.state;
      _deliveryZipCodeController.text = widget.load.deliveryLocation.zipCode;
      _deliveryDateController.text =
          DateFormat('MM-dd-yyyy').format(widget.load.deliveryDate);
      _rateController.updateValue(widget.load.rate);
      _poNumController.text = widget.load.poNum;
      _loadNumController.text = widget.load.loadNum;
      _refNumController.text = widget.load.refNum;
      _orderNumController.text = widget.load.orderNum;

      pickUpDate = widget.load.pickUpDate;
      deliveryDate = widget.load.deliveryDate;
    }
  }

  void dispose() {
    _shipperController.dispose();
    _pickUpStreetController.dispose();
    _pickUpCityController.dispose();
    _pickUpStateController.dispose();
    _pickUpZipCodeController.dispose();
    _pickUpDateController.dispose();
    _consigneeController.dispose();
    _deliveryStreetController.dispose();
    _deliveryCityController.dispose();
    _deliveryStateController.dispose();
    _deliveryZipCodeController.dispose();
    _deliveryDateController.dispose();
    _rateController.dispose();
    _poNumController.dispose();
    _loadNumController.dispose();
    _refNumController.dispose();
    _orderNumController.dispose();
    super.dispose();
  }

  void onFormatClick() {
    _shipperController.text = _shipperController.text.titleCase;
    _pickUpStreetController.text = _pickUpStreetController.text.titleCase;
    _pickUpCityController.text = _pickUpCityController.text.titleCase;
    _consigneeController.text = _consigneeController.text.titleCase;
    _deliveryStreetController.text = _deliveryStreetController.text.titleCase;
    _deliveryCityController.text = _deliveryCityController.text.titleCase;
  }

  void onActionClick() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });

      Map<String, dynamic> form = {
        "customerId": selectedCustomer.id,
        "driverId": selectedDriver.id,
        "shipper": _shipperController.text.trim(),
        "pickUpLocation": {
          "street": _pickUpStreetController.text.trim(),
          "city": _pickUpCityController.text.trim(),
          "state": _pickUpStateController.text.trim(),
          "zipCode": _pickUpZipCodeController.text.trim(),
        },
        "pickUpDate": pickUpDate.toString(),
        "consignee": _consigneeController.text.trim(),
        "deliveryLocation": {
          "street": _deliveryStreetController.text.trim(),
          "city": _deliveryCityController.text.trim(),
          "state": _deliveryStateController.text.trim(),
          "zipCode": _deliveryZipCodeController.text.trim(),
        },
        "deliveryDate": deliveryDate.toString(),
        "rate": _rateController.numberValue,
        "poNum": _poNumController.text.trim(),
        "loadNum": _loadNumController.text.trim(),
        "refNum": _refNumController.text.trim(),
        "orderNum": _orderNumController.text.trim(),
      };

      if (widget.load != null) {
        Map<String, dynamic> loadJson = {
          ...widget.load.toJson(),
          ...form,
        };

        Load load = Load.fromJson(widget.load.id, loadJson);

        await LoadService.updateLoad(
          context,
          widget.load.id,
          load,
        );
      } else {
        Load load = Load.fromJson(null, form);

        await LoadService.createLoad(
          context,
          load,
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
    customersStore = Provider.of<CustomersStore>(context);
    driversStore = Provider.of<DriversStore>(context);

    customerOptions = customersStore.customersList
        .map((customer) =>
            S2Choice<Customer>(value: customer, title: customer.title))
        .toList();

    driverOptions = driversStore.driversList
        .map(
            (driver) => S2Choice<Driver>(value: driver, title: driver.fullName))
        .toList();

    if (widget.load != null && selectedCustomer == null) {
      selectedCustomer = customersStore.customers[widget.load.customerId];
    }
    if (widget.load != null && selectedDriver == null) {
      selectedDriver = driversStore.drivers[widget.load.driverId];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.load != null ? 'Edit Load' : 'New Load',
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
                        width: 66,
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
                        icon: Text(
                          this.widget.load != null ? 'SAVE' : 'ADD',
                        ),
                        onPressed: onActionClick,
                      ),
              ],
            ),
          ),
        ],
      ),
      body: Form(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                    inputDecorationTheme: InputDecorationTheme(),
                  ),
                  child: SmartSelect<Customer>.single(
                    modalType: S2ModalType.popupDialog,
                    modalHeaderStyle: getS2ModalHeaderStyle(context),
                    choiceStyle: getS2ChoiceStyle(context),
                    title: 'Customer',
                    value: selectedCustomer,
                    choiceItems: customerOptions,
                    modalFilter: true,
                    onChange: (state) =>
                        setState(() => selectedCustomer = state.value),
                  ),
                ),
                SizedBox(height: 10),
                Theme(
                  data: Theme.of(context).copyWith(
                    inputDecorationTheme: InputDecorationTheme(),
                  ),
                  child: SmartSelect<Driver>.single(
                    modalType: S2ModalType.popupDialog,
                    modalHeaderStyle: getS2ModalHeaderStyle(context),
                    choiceStyle: getS2ChoiceStyle(context),
                    title: 'Driver',
                    value: selectedDriver,
                    choiceItems: driverOptions,
                    modalFilter: true,
                    onChange: (state) =>
                        setState(() => selectedDriver = state.value),
                  ),
                ),
                SizedBox(height: 25),
                Text("Pick Up:", style: Theme.of(context).textTheme.headline5),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _shipperController,
                        decoration: InputDecoration(
                          labelText: 'Shipper',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Shipper is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        enableInteractiveSelection: false,
                        readOnly: true,
                        controller: _pickUpDateController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () async {
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: pickUpDate ?? DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2500),
                              );
                              if (selectedDate != null &&
                                  selectedDate != pickUpDate) {
                                setState(() {
                                  pickUpDate = selectedDate;
                                  _pickUpDateController.text =
                                      DateFormat('MM-dd-yyyy')
                                          .format(pickUpDate);
                                });
                              }
                            },
                          ),
                          labelText: 'Pick Up Date',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Pick up date is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _pickUpStreetController,
                        decoration: InputDecoration(
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _pickUpCityController,
                        decoration: InputDecoration(
                          labelText: 'City',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _pickUpStateController,
                        decoration: InputDecoration(
                          labelText: 'State',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _pickUpZipCodeController,
                        decoration: InputDecoration(
                          labelText: 'Zip Code',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Text("Drop Off:", style: Theme.of(context).textTheme.headline5),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _consigneeController,
                        decoration: InputDecoration(
                          labelText: 'Consignee',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Consignee is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        readOnly: true,
                        controller: _deliveryDateController,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () async {
                              final selectedDate = await showDatePicker(
                                context: context,
                                initialDate: deliveryDate ?? DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2500),
                              );
                              if (selectedDate != null &&
                                  selectedDate != deliveryDate) {
                                setState(() {
                                  deliveryDate = selectedDate;
                                  _deliveryDateController.text =
                                      DateFormat('MM-dd-yyyy')
                                          .format(deliveryDate);
                                });
                              }
                            },
                          ),
                          labelText: 'Delivery Date',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Delivery date is required';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _deliveryStreetController,
                        decoration: InputDecoration(
                          labelText: 'Street',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _deliveryCityController,
                        decoration: InputDecoration(
                          labelText: 'City',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _deliveryStateController,
                        decoration: InputDecoration(
                          labelText: 'State',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _deliveryZipCodeController,
                        decoration: InputDecoration(
                          labelText: 'Zip Code',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                TextFormField(
                  controller: _rateController,
                  enableInteractiveSelection: false,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    labelText: 'Rate',
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _poNumController,
                        decoration: InputDecoration(
                          labelText: 'PO #',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _loadNumController,
                        decoration: InputDecoration(
                          labelText: 'Load #',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _refNumController,
                        decoration: InputDecoration(
                          labelText: 'Ref #',
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _orderNumController,
                        decoration: InputDecoration(
                          labelText: 'Order #',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
