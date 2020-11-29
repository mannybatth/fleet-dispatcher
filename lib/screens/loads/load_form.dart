import 'package:auto_route/auto_route.dart';
import 'package:fleet_dispatcher/models/load.dart';
import 'package:fleet_dispatcher/services/load_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoadForm extends StatefulWidget {
  final Load load;
  LoadForm({Key key, this.load}) : super(key: key);

  @override
  _LoadFormState createState() => _LoadFormState();
}

class _LoadFormState extends State<LoadForm> {
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

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
      _pickUpLocationController.text = widget.load.pickUpLocation;
      _consigneeController.text = widget.load.consignee;
      _deliveryLocationController.text = widget.load.deliveryLocation;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.widget.load != null ? this.widget.load.id : 'New Load',
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
                    child: Text(this.widget.load != null ? 'SAVE' : 'ADD'),
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
