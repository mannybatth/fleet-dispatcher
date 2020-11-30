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
import 'package:provider/provider.dart';
import 'package:smart_select/smart_select.dart';

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

  final _shipperController = TextEditingController();
  final _pickUpLocationController = TextEditingController();
  final _consigneeController = TextEditingController();
  final _deliveryLocationController = TextEditingController();
  final _rateController = TextEditingController(text: "0");
  final _poNumController = TextEditingController();
  final _loadNumController = TextEditingController();
  final _refNumController = TextEditingController();
  final _orderNumController = TextEditingController();

  void initState() {
    super.initState();

    if (widget.load != null) {
      _shipperController.text = widget.load.shipper;
      _pickUpLocationController.text = widget.load.pickUpLocation.street;
      _consigneeController.text = widget.load.consignee;
      _deliveryLocationController.text = widget.load.deliveryLocation.street;
      _rateController.text = '${widget.load.rate}';
      _poNumController.text = widget.load.poNum;
      _loadNumController.text = widget.load.loadNum;
      _refNumController.text = widget.load.refNum;
      _orderNumController.text = widget.load.orderNum;
    }
  }

  void dispose() {
    _shipperController.dispose();
    _pickUpLocationController.dispose();
    _consigneeController.dispose();
    _deliveryLocationController.dispose();
    _rateController.dispose();
    _poNumController.dispose();
    _loadNumController.dispose();
    _refNumController.dispose();
    _orderNumController.dispose();
    super.dispose();
  }

  void onActionClick() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });

      Map<String, dynamic> form = {
        "shipper": _shipperController.text.trim(),
        "pickUpLocation": _pickUpLocationController.text.trim(),
        "consignee": _consigneeController.text.trim(),
        "deliveryLocation": _deliveryLocationController.text.trim(),
        "rate": int.parse(_rateController.text ?? "0"),
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

  void onCustomerSelectClick() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Choose Options'),
        message: const Text('Your options are '),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: const Text('One'),
            onPressed: () {
              Navigator.pop(context, 'One');
            },
          ),
          CupertinoActionSheetAction(
            child: const Text('Two'),
            onPressed: () {
              Navigator.pop(context, 'Two');
            },
          )
        ],
      ),
    );
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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.load != null ? 'Edit Load' : 'New Load',
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
                    icon: Text(
                      this.widget.load != null ? 'SAVE' : 'ADD',
                    ),
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
                SizedBox(height: 10),
                TextFormField(
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
                SizedBox(height: 10),
                TextFormField(
                  controller: _pickUpLocationController,
                  decoration: InputDecoration(
                    labelText: 'Pick Up Location',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _consigneeController,
                  decoration: InputDecoration(
                    labelText: 'Consignee',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _deliveryLocationController,
                  decoration: InputDecoration(
                    labelText: 'Delivery Location',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _rateController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    labelText: 'Rate',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _poNumController,
                  decoration: InputDecoration(
                    labelText: 'PO #',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _loadNumController,
                  decoration: InputDecoration(
                    labelText: 'Load #',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _refNumController,
                  decoration: InputDecoration(
                    labelText: 'Ref #',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _orderNumController,
                  decoration: InputDecoration(
                    labelText: 'Order #',
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
