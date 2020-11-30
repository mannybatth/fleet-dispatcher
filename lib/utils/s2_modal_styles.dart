import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';

getS2ModalHeaderStyle(BuildContext context) {
  return S2ModalHeaderStyle(
    brightness: Theme.of(context).brightness,
    iconTheme: Theme.of(context).appBarTheme.iconTheme,
    actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
    backgroundColor: Theme.of(context).appBarTheme.color,
    textStyle: Theme.of(context).primaryTextTheme.headline6,
  );
}

getS2ChoiceStyle(BuildContext context) {
  return S2ChoiceStyle(
    brightness: Theme.of(context).brightness,
    activeBrightness: Theme.of(context).brightness,
    titleStyle: Theme.of(context).textTheme.button,
  );
}
