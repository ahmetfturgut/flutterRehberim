import 'package:flutter/material.dart';
import 'package:flutter_rehberim/widgets/buttons_widget.dart';
import 'package:flutter_rehberim/widgets/card_inkwell_widget.dart';
import 'package:flutter_rehberim/widgets/checkbox_widget.dart';
import 'package:flutter_rehberim/widgets/dropdownbutton_menubutton.dart';
import 'package:flutter_rehberim/widgets/icon_widget.dart';
import 'package:flutter_rehberim/widgets/image_widget.dart';
import 'package:flutter_rehberim/widgets/indicators_widget.dart';
import 'package:flutter_rehberim/widgets/radio_widget.dart';
import 'package:flutter_rehberim/widgets/slider_widget.dart';
import 'package:flutter_rehberim/widgets/switch_widget.dart';
import 'package:flutter_rehberim/widgets/text_field_widget.dart';
import 'package:flutter_rehberim/widgets/text_form_field_widget.dart';
import 'package:flutter_rehberim/widgets/text_widget.dart';

class Layaut extends StatefulWidget {
  String widgetKey;

  Layaut({this.widgetKey});

  @override
  _Layautstate createState() => _Layautstate();
}

class _Layautstate extends State<Layaut> {
  @override
  Widget build(BuildContext context) {
    if (widget.widgetKey == "Icon") {
      return IconWidget();
    } else if (widget.widgetKey == "Text") {
      return TextWidget();
    } else if (widget.widgetKey == "TextField") {
      return TextFieldExample();
    } else if (widget.widgetKey == "TextFormField") {
      return TextFormFieldExample();
    } else if (widget.widgetKey == "Image") {
      return ImageExample();
    } else if (widget.widgetKey == "Card,Inkwell") {
      return CardExample();
    } else if (widget.widgetKey == "Buttons") {
      return ButtonsExample();
    } else if (widget.widgetKey == "DropdownButton,MenuButton") {
      return DropdownButtonExample();
    } else if (widget.widgetKey == "Switch") {
      return SwitchWidget();
    } else if (widget.widgetKey == "Checkbox") {
      return CheckBoxWidget();
    } else if (widget.widgetKey == "Slider") {
      return SliderWidget();
    } else if (widget.widgetKey == "Indicator") {
      return IndicatorWidget();
    } else if (widget.widgetKey == "Radio") {
      return RadioWidget();
    }
  }
}
