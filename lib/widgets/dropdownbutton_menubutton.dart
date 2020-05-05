import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  static const menuItems = <String>[
   "Karışık Pizza",
                  "Pastırmalı Pizza",
                  "Mexico Pizza",
                  "İtalyan Pizza",
                  "Anadolu Pizza",
                  "Vejeteryan Pizza"
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  )
      .toList();
  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
      value: value,
      child: Text(value),
    ),
  )
      .toList();

  String _btn1SelectedVal = 'Karışık Pizza';
  String _btn2SelectedVal;
  String _btn3SelectedVal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text('Üzerine tıkladığımız zaman açılan ve içerisinde seçim yaptığımız buton türlerini görmüşsünüzdür.'
          ' Flutter’da bu buton türünün ismi Dropdown Button olarak karşımıza çıkıyor.'
          ' Bizde pizza seçimi yaptıran bir dropdown button örneğini şimdi beraber yapalım.',style: TextStyle(fontSize: 16),),
        ),
        ListTile(
          title: Text('DropDownButton:'),
          trailing: DropdownButton<String>(
            // Must be one of items.value.
            value: _btn1SelectedVal,
            onChanged: (String newValue) {
              setState(() {
                _btn1SelectedVal = newValue;
              });
            },
            items: this._dropDownMenuItems,
          ),
        ),
        ListTile(
          title: Text('DropDownButton + hint:'),
          trailing: DropdownButton(
            value: _btn2SelectedVal,
            hint: Text('Seç'),
            onChanged: ((String newValue) {
              setState(() {
                _btn2SelectedVal = newValue;
              });
            }),
            items: _dropDownMenuItems,
          ),
        ),
        ListTile(
          title: const Text('Popup menu button:'),
          trailing: new PopupMenuButton<String>(
            onSelected: (String newValue) {
              _btn3SelectedVal = newValue;
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('$_btn3SelectedVal'),
                ),
              );
            },
            itemBuilder: (BuildContext context) => _popUpMenuItems,
          ),
        ),
      ],
    );
  }
}