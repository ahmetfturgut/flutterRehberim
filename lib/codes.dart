class Codes {
  String iconCode = """
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icon Test"),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),),
      body: Container(
        child: Center(child: Icon(Icons.check, size: 64.0, color: Colors.teal)),
      ),
    );
  }
}       
             """;

  String textCode = """
import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  const TextExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Simple text demo.',
      // Optional params to try:
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.blue,
          fontSize: 32.0,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline),
      // Or:
      // style: Theme.of(context).textTheme.xxx
    );
  }
}
""";

  String textField = """import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TextFieldExample extends StatefulWidget {
  const TextFieldExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextFieldExampleState();
}

class _TextFieldExampleState extends State<TextFieldExample> {
  bool _numberInputIsValid = true;

  Widget _buildNumberTextField() {
    return TextField(
      keyboardType: TextInputType.number,
      style: Theme.of(context).textTheme.display1,
      decoration: InputDecoration(
        icon: Icon(Icons.attach_money),
        labelText: 'Enter an integer:',
        errorText: _numberInputIsValid ? null : 'Please enter an integer!',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      onSubmitted: (val) =>
          Fluttertoast.showToast(msg: 'You entered: \${int.parse(val)}'),
      onChanged: (String val) {
        final v = int.tryParse(val);
        debugPrint('parsed value = \$v');
        if (v == null) {
          setState(() => _numberInputIsValid = false);
        } else {
          setState(() => _numberInputIsValid = true);
        }
      },
    );
  }

  final _controller = TextEditingController();

  Widget _buildMultilineTextField() {
    return TextField(
      controller: this._controller,
      maxLines: 10,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counterText: '\${this._controller.text.split(' ').length} words',
        labelText: 'Enter multiline text:',
        hintText: 'type something...',
        border: OutlineInputBorder(),
      ),
      onChanged: (text) => setState(() {}),
    );
  }

  bool _showPassword = false;

  Widget _buildPasswordTextField() {
    return TextField(
      obscureText: !this._showPassword,
      decoration: InputDecoration(
        labelText: 'password',
        prefixIcon: Icon(Icons.security),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.remove_red_eye,
            color: this._showPassword ? Colors.blue : Colors.grey,
          ),
          onPressed: () {
            setState(() => this._showPassword = !this._showPassword);
          },
        ),
      ),
    );
  }

  Widget _buildBorderlessTextField() {
    return TextField(
      maxLines: 3,
      decoration: InputDecoration.collapsed(hintText: 'borderless input'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        ListTile(title: Text('1. Number input field')),
        _buildNumberTextField(),
        ListTile(title: Text('2. Multiline input field')),
        _buildMultilineTextField(),
        ListTile(title: Text('3. Password input field')),
        _buildPasswordTextField(),
        ListTile(title: Text('4. Borderless input')),
        _buildBorderlessTextField(),
      ],
    );
  }
}
 """;

  String textFormField = """ 

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldExample extends StatefulWidget {
  const TextFormFieldExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextFormFieldExampleState();
}
 
class _TextFormFieldExampleState extends State<TextFormFieldExample> {
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      new GlobalKey<FormFieldState<String>>();

  String _name;
  String _phoneNumber;
  String _email;
  String _password;

  String _validateName(String value) {
    if (value.isEmpty) return 'Name is required.';
    final RegExp nameExp = new RegExp(r'^[A-Za-z ]');
    if (!nameExp.hasMatch(value))
      return 'Please enter only alphabetical characters.';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 24.0),
          // "Name" form.
          TextFormField(
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.person),
              hintText: 'What do people call you?',
              labelText: 'Name *',
            ),
            onSaved: (String value) {
              this._name = value;
            },
            validator: _validateName,
          ),
          SizedBox(height: 24.0),
          // "Phone number" form.
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.phone),
              hintText: 'Where can we reach you?',
              labelText: 'Phone Number *',
              prefixText: '+86',
            ),
            keyboardType: TextInputType.phone,
            onSaved: (String value) {
              this._phoneNumber = value;
            },
            // TextInputFormatters are applied in sequence.
            inputFormatters: <TextInputFormatter>[
              WhitelistingTextInputFormatter.digitsOnly,
            ],
          ),
          SizedBox(height: 24.0),
          // "Email" form.
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              icon: Icon(Icons.email),
              hintText: 'Your email address',
              labelText: 'E-mail',
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (String value) {
              this._email = value;
            },
          ),
          SizedBox(height: 24.0),
          // "Life story" form.
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Tell us about yourself',
              helperText: 'Keep it short, this is just a demo.',
              labelText: 'Life story',
            ),
            maxLines: 3,
          ),
          SizedBox(height: 24.0),
          // "Salary" form.
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Salary',
                prefixText: '\$',
                suffixText: 'USD',
                suffixStyle: TextStyle(color: Colors.green)),
            maxLines: 1,
          ),
          SizedBox(height: 24.0),
          // "Password" form.
          PasswordField(
            fieldKey: _passwordFieldKey,
            helperText: 'No more than 8 characters.',
            labelText: 'Password *',
            onFieldSubmitted: (String value) {
              setState(() {
                this._password = value;
              });
            },
          ),
          SizedBox(height: 24.0),
          // "Re-type password" form.
          TextFormField(
            enabled: this._password != null && this._password.isNotEmpty,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              filled: true,
              labelText: 'Re-type password',
            ),
            maxLength: 8,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField({
    this.fieldKey,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String hintText;
  final String labelText;
  final String helperText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _PasswordFieldState createState() => new _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: new InputDecoration(
        border: const UnderlineInputBorder(),
        filled: true,
        hintText: widget.hintText,
        labelText: widget.labelText,
        helperText: widget.helperText,
        suffixIcon: new GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child:
              new Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}
""";

  String image = """ 
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart'
    show kTransparentImage;

class ImageExample extends StatelessWidget {
  const ImageExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ListTile(title: Text('Image from asset:')),
        Card(
          child: Image.asset('res/images/dart-side.png'),
        ),
        Divider(),
        ListTile(title: Text('Image from url:')),
        Card(
          // FadeInImage is better than Image.network because it can show a
          // placeholder when image is loading. C.f.
          // https://flutter.io/docs/cookbook/images/fading-in-images
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image:
                'https://images.freeimages.com/images/large-previews/4ad/coloured-pencils-1427682.jpg',
          ),
        ),
        Divider(),
        ListTile(title: Text('Cached network image:')),
        CachedNetworkImage(
          imageUrl: 'https://picsum.photos/id/7/250/250',
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Divider(),
        ListTile(title: Text('GIF from asset:')),
        Image.asset(
          'res/images/animated_flutter_lgtm.gif',
          scale: 1.0,
          height: 300,
        )
      ],
    );
  }
}
""";

  String cardInkwell = """
import 'package:flutter/material.dart';

class CardExample extends StatelessWidget {
  const CardExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        Card(
          color: Colors.red,
          // The elevation determines shade.
          elevation: 10.0,
          child: Container(
            height: 100.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Card 1'),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.green,
          margin: EdgeInsets.all(20.0),
          elevation: 0.0,
          child: Container(
            height: 100.0,
            child: InkWell(
              splashColor: Colors.deepOrange,
              onTap: () {},
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Card 2 (with Inkwell effect on tap)'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.elliptical(40.0, 80.0),
            ),
          ),
          child: Container(
            height: 100.0,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('Card 3 (with custom border radius)'),
                ),
              ],
            ),
          ),
        ),
        Card(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 180.0,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/flutter3.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Card 4 (complex example)',
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text('SHARE'),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Text('EXPLORE'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
 """;

  String buttons = """
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonsExample extends StatelessWidget {
  const ButtonsExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _showToast = () => Fluttertoast.showToast(
      msg: 'Button tapped',
      toastLength: Toast.LENGTH_SHORT,
    );

    final _showSnack = () => Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Button tapped'),
        duration: Duration(milliseconds: 500),
      ),
    );
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            Text('Raised buttons add dimension to mostly flat layouts. They '
                'emphasize functions on busy or wide spaces.'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('RaisedButton'),
                  onPressed: _showSnack,
                ),
                RaisedButton(
                  child: Text('disabled-RaisedButton'),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Column(
          children: <Widget>[
            Text('A flat button displays an ink splash on press '
                'but does not lift. Use flat buttons on toolbars, in dialogs '
                'and inline with padding'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text('FlatButton'),
                  onPressed: _showToast,
                ),
                FlatButton(
                  child: Text('disabled-FlatButton'),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
        Divider(),
        Column(
          children: <Widget>[
            Text('Outline buttons become opaque and elevate when pressed. They '
                'are often paired with raised buttons to indicate an '
                'alternative, secondary action.'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlineButton(
                  child: Text('OutlineButton'),
                  onPressed: _showToast,
                ),
                OutlineButton(
                  child: Text('OutlineButton'),
                  onPressed: null,
                )
              ],
            ),
          ],
        ),
        Divider(),
        Column(
          children: <Widget>[
            Text('Tooltips are short identifying messages that briefly appear '
                'in response to a long press. Tooltip messages are also used '
                'by services that make Flutter apps accessible, like screen '
                'readers.'),
            Center(
              child: IconButton(
                iconSize: 32.0,
                icon: Icon(Icons.call),
                tooltip: 'Place a phone call',
                onPressed: _showSnack,
              ),
            )
          ],
        ),
      ],
    );
  }
}
 """;
  String dropdownButtonExample = """ 
 import 'package:flutter/material.dart';
 
class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  static const menuItems = <String>[
    'One',
    'Two',
    'Three',
    'Four',
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

  String _btn1SelectedVal = 'One';
  String _btn2SelectedVal;
  String _btn3SelectedVal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('DropDownButton with default:'),
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
          title: Text('DropDownButton with hint:'),
          trailing: DropdownButton(
            value: _btn2SelectedVal,
            hint: Text('Choose'),
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
                  content: Text('\$_btn3SelectedVal'),
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
""";

  String switchCode = """ 
import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool _switchVal = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Switch(
                onChanged: (bool value) {
                  setState(() => this._switchVal = value);
                },
                value: this._switchVal,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Stitch : \$_switchVal",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Switch(
                onChanged: null,
                value: false,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Switch : false",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),

      ],
    );
  }
}



""";
  String checkbox = """
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool _checkBoxVal = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child:  Checkbox(
                onChanged: (bool value) {
                  setState(() => this._checkBoxVal = value);
                },
                value: this._checkBoxVal,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Checkbox : \$_checkBoxVal",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              tristate: true,
              onChanged: null,
              value: null,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Checkbox : false",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),

      ],
    );
  }
}

 """;
  String slider = """ 
import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _slider1Val = 0.5;
  double _slider2Val = 50.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Slider(
          onChanged: (double value) {
            setState(() => this._slider1Val = value);
          },
          value: this._slider1Val,
        ),
        SizedBox(height: 30,),
        Slider(
            value: _slider2Val,
            min: 0.0,
            max: 100.0,
            divisions: 5,
            label: ' \${_slider2Val.round()}',
            onChanged: (double value) {
              setState(() => _slider2Val = value);
            }),

      ],
    );
  }
}

""";

  String indicator = """
import 'package:flutter/material.dart';
class IndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('LinearProgressIndicator'), 
          LinearProgressIndicator(),

          SizedBox(height: 40,),
          Text('CircularProgressIndicator'),
          Center(child: CircularProgressIndicator()),

        ],
      ),
    );
  }
}

 """;

  String radio = """
import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({Key key}) : super(key: key);

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int _radioVal = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Row(
        children: <Widget>[
          Text('Radio',style: TextStyle(fontSize: 25),),
          SizedBox(width: 40,),
          Row(
            children: [0, 1, 2, 3]
                .map((int index) => Radio<int>(
                      value: index,
                      groupValue: this._radioVal,
                      onChanged: (int value) {
                        setState(() => this._radioVal = value);
                      },
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

 """;

  String container = """
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LContainerWidget(),
    );
  }
}

class LContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(5.0),
              color: Theme
                  .of(context)
                  .primaryColor,
              child: Center(
                  child: Text(
                    'Eğik Container',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 96.0,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Theme
                  .of(context)
                  .primaryColor,
              alignment: Alignment.center,
              child: Text('Eğik Container',
                  style: Theme
                      .of(context)
                      .textTheme
                      .display1
                      .copyWith(color: Colors.white)),
              transform: Matrix4.skewY(0.2),
            ),
            SizedBox(
              height: 48,
            ),
            Container(
              constraints: BoxConstraints.expand(
                height:
                Theme
                    .of(context)
                    .textTheme
                    .display1
                    .fontSize * 1.0 + 50.0,
              ),
              padding: const EdgeInsets.all(8.0),
              color: Theme
                  .of(context)
                  .primaryColor,
              alignment: Alignment.center,
              child: Text(
                'Eğik Container',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              transform: Matrix4.rotationZ(0.2),
            ),
            SizedBox(
              height: 64,
            ),
            Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Center(
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                  child: Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.green,
                      child: Center(
                        child: Container(
                          height: 25,
                          width: 25,
                          color: Colors.red,
                          child: Center(
                            child: Container(
                              height: 15,
                              width: 15,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
 """;

  String row = """
import 'package:flutter/material.dart';

class LRow extends StatefulWidget {
  @override
  _LRowState createState() => _LRowState();
}

enum SingingCharacter { spaceEvenly, start, center }

class _LRowState extends State<LRow> {
  SingingCharacter _character = SingingCharacter.spaceEvenly;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.spaceEvenly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: _mainAxisAlignment,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    color: Colors.green[50],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "İtem1",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.yellow[50],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "İtem2",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.red[50],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "İtem3",
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Row(
              children: <Widget>[
                Radio(
                  value: SingingCharacter.spaceEvenly,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.spaceEvenly;
                    });
                  },
                ),
                Text("Evently"),
                Radio(
                  value: SingingCharacter.start,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.start;
                    });
                  },
                ),
                Text("Start"),
                Radio(
                  value: SingingCharacter.center,
                  groupValue: _character,
                  onChanged: (SingingCharacter value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.center;
                    });
                  },
                ),
                Text("Center"),
              ],
            ),
          ),
        )
      ],
    );
  }
}

 """;

  String column = """
import 'package:flutter/material.dart';

class LColumn extends StatefulWidget {
  @override
  _LColumnState createState() => _LColumnState();
}

enum ALIGN { spaceEvenly, start, center }

class _LColumnState extends State<LColumn> {
  ALIGN _character = ALIGN.spaceEvenly;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.spaceEvenly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Theme
                .of(context)
                .accentColor
                .withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: _mainAxisAlignment,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Bu Column Widget - İtem1",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Text(
                    "Bu Column Widget - İtem2",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Image.asset(
                    "assets/images/flutter-sdk.png",
                    fit: BoxFit.fitHeight,
                  ),
                  Text(
                    "Bu Column Widget - İtem4",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),

                  //new Container()
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Row(
              children: <Widget>[
                Radio(
                  value: ALIGN.spaceEvenly,
                  groupValue: _character,
                  onChanged: (ALIGN value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.spaceEvenly;
                    });
                  },
                ),
                Text("Evently"),
                Radio(
                  value: ALIGN.start,
                  groupValue: _character,
                  onChanged: (ALIGN value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.start;
                    });
                  },
                ),
                Text("Start"),
                Radio(
                  value: ALIGN.center,
                  groupValue: _character,
                  onChanged: (ALIGN value) {
                    setState(() {
                      _character = value;
                      _mainAxisAlignment = MainAxisAlignment.center;
                    });
                  },
                ),
                Text("Center"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
 """;
  String wrap = """
import 'package:flutter/material.dart';

class LWrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Wrap(
                direction: Axis.vertical,
                spacing: 16.0, // gap between adjacent chips
                runSpacing: 8.0, // gap between lines
                children: <Widget>[
                  CircleAvatar(child: Text('A')),
                  CircleAvatar(child: Text('B')),
                  CircleAvatar(child: Text('C')),
                  CircleAvatar(child: Text('D')),
                  CircleAvatar(child: Text('E')),
                  CircleAvatar(child: Text('F')),
                  CircleAvatar(child: Text('G')),
                  CircleAvatar(child: Text('H')),
                  CircleAvatar(child: Text('I')),
                  CircleAvatar(child: Text('J')),
                  CircleAvatar(child: Text('K')),
                  CircleAvatar(child: Text('L')),
                  CircleAvatar(child: Text('M')),
                  CircleAvatar(child: Text('N')),
                  CircleAvatar(child: Text('O')),
                  CircleAvatar(child: Text('P')),
                  CircleAvatar(child: Text('Q')),
                  CircleAvatar(child: Text('R')),
                  CircleAvatar(child: Text('S')),
                  CircleAvatar(child: Text('T')),
                  CircleAvatar(child: Text('U')),
                  CircleAvatar(child: Text('V')),
                  CircleAvatar(child: Text('W')),
                  CircleAvatar(child: Text('X')),
                  CircleAvatar(child: Text('Y')),
                  CircleAvatar(child: Text('Z')),
                ],
              ),
            ),
          ),
          SizedBox(height: 80,),
          Expanded(
            child: Wrap(
              direction: Axis.horizontal,
              spacing: 16.0, // gap between adjacent chips
              runSpacing: 8.0, // gap between lines
              children: <Widget>[
                CircleAvatar(child: Text('0')),
                CircleAvatar(child: Text('1')),
                CircleAvatar(child: Text('2')),
                CircleAvatar(child: Text('3')),
                CircleAvatar(child: Text('4')),
                CircleAvatar(child: Text('5')),
                CircleAvatar(child: Text('6')),
                CircleAvatar(child: Text('7')),
                CircleAvatar(child: Text('8')),
                CircleAvatar(child: Text('9')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

 """;
  String expanded = """
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.teal,
            height: 50,
            child: Center(child: Text("Container Top")),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.teal,
                          height: 100,
                          child: Center(child: Text(" flex: 2")),
                        ),
                      ),
                      Container(
                        color: Colors.blue,
                        height: 100,
                        width: 100,
                        child: Center(child: Text("Container")),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.teal,
                          height: 100,
                          child: Center(child: Text(" flex: 1")),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.teal,
                          height: 100,
                          child: Center(child: Text("flex: 2")),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.blue,
                          height: 100,
                          child: Center(child: Text("flex: 3")),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.teal,
                          height: 100,
                          child: Center(child: Text(" flex: 1")),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.teal,
            height: 50,
            child: Center(child: Text("Container Bottom")),
          ),
        ],
      ),
    );
  }
}

 """;

  String sizedBox = """
import 'package:flutter/material.dart';

class LSizedBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          color: Colors.teal,
          onPressed: () {},
          child: Text("Simple RaisedButton"),
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(

          color: Colors.teal.shade200,
          onPressed: () {},
          child: Text("Simple RaisedButton"),
        ),
        SizedBox(
          height: 100,

          child: RaisedButton(

            color: Colors.teal.shade300,
            onPressed: () {},
            child: Text("Button with specific height"),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 100,
          child: RaisedButton(

            color: Colors.teal.shade400,
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Button with specific width"),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: RaisedButton(

              color: Colors.teal.shade100,
              onPressed: () {}, child: Text("Button with infinity width")),
        )
      ],
    );
  }
}
 """;

  String stack = """
import 'package:flutter/material.dart';

class LStack extends StatefulWidget {
  const LStack({Key key}) : super(key: key);

  @override
  _LStackState createState() => new _LStackState();
}

class _LStackState extends State<LStack> {
  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: _alignmentDirectional,
          children: <Widget>[
            Container(width: 300.0, height: 300.0, color: Colors.red),
            Container(width: 200.0, height: 200.0, color: Colors.green),
            Container(width: 100.0, height: 100.0, color: Colors.blue),
          ],
        ),
      ),
      bottomNavigationBar: _getBottomBar(),
    );
  }

  Widget _getBottomBar() {
    const kAlignmentDirectionalVals = <String, AlignmentDirectional>{
      'topStart': AlignmentDirectional.topStart,
      'topCenter': AlignmentDirectional.topCenter,
      'topEnd': AlignmentDirectional.topEnd,
      'centerStart': AlignmentDirectional.centerStart,
      'center': AlignmentDirectional.center,
      'centerEnd': AlignmentDirectional.centerEnd,
      'bottomStart': AlignmentDirectional.bottomStart,
      'bottomCenter': AlignmentDirectional.bottomCenter,
      'bottomEnd': AlignmentDirectional.bottomEnd
    };
    return Material(
      color: Theme.of(context).primaryColorLight,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            title: Text('alignmentDirectional:'),
            trailing: DropdownButton<AlignmentDirectional>(
              value: _alignmentDirectional,
              onChanged: (AlignmentDirectional newVal) {
                if (newVal != null) {
                  setState(() => this._alignmentDirectional = newVal);
                }
              },
              items: kAlignmentDirectionalVals
                  .map(
                    (String name, AlignmentDirectional val) => MapEntry(
                  name,
                  DropdownMenuItem(value: val, child: Text(name)),
                ),
              )
                  .values
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
 """;

  String listtile = """
import 'package:flutter/material.dart';

class ListTilE extends StatelessWidget {
  const ListTilE({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const listTiles = <Widget>[
      ListTile(
        title: Text('Tile 0: basic'),
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.face),
        title: Text('Tile 1: with leading/trailing widgets'),
        trailing: Icon(Icons.tag_faces),
      ),
      Divider(),
      ListTile(
        title: Text('Tile 2 title'),
        subtitle: Text('subtitle of tile 2'),
      ),
      Divider(),
      ListTile(
        title: Text('Tile 3: 3 lines'),
        isThreeLine: true,
        subtitle: Text('subtitle of tile 3'),
      ),
      Divider(),
      ListTile(
        title: Text('Tile 4: dense'),
        dense: true,
      ),
    ];

    return ListView(children: listTiles);
  }
}
 """;
  String listvievbuilder = """
import 'package:flutter/material.dart';

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final numItems = 20;
    final _biggerFont = const TextStyle(fontSize: 18.0);

    Widget _buildRow(int idx) {
      return ListTile(
        leading: CircleAvatar(
          child: Text('\$idx'),
        ),
        title: Text(
          'Item \$idx',
          style: _biggerFont,
        ),
        trailing: Icon(Icons.dashboard),
      );
    }

    return ListView.builder(
      itemCount: numItems * 2,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (BuildContext context, int i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2 + 1;
        return _buildRow(index);
      },
    );
  }
}
 """;

  String gridlist = """ 
import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  const GridList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this would produce 2 rows.
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      // Generate 100 Widgets that display their index in the List
      children: List.generate(100, (index) {
        return Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.teal.shade200,
              border: Border.all(color: Colors.grey, width: 3.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Item \$index',
              style: Theme.of(context).textTheme.headline,
            ),
          ),
        );
      }),
    );
  }
}
""";

  String expansipontile = """ 
import 'package:flutter/material.dart';

class ExpansionTilE extends StatelessWidget {
  const ExpansionTilE({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
      itemCount: data.length,
    );
  }
}

class Entry {
  const Entry(this.title, [this.children = const <Entry>[]]);
  final String title;
  final List<Entry> children;
}

const List<Entry> data = <Entry>[
  Entry(
    'Bölüm A',
    <Entry>[
      Entry(
        'Seçenek A0',
        <Entry>[
          Entry('Eleman A0.1'),
          Entry('Eleman A0.2'),
        ],
      ),
      Entry('Seçenek A1'),
      Entry('Seçenek A2'),
    ],
  ),
  Entry(
    'Bölüm B',
    <Entry>[
      Entry('Seçenek B0'),
      Entry('Seçenek B1'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) return ListTile(title: Text(root.title));
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title),
      children: root.children.map(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
""";

  String swipetodismiss = """
import 'package:flutter/material.dart';

class ListSwipeToDismiss extends StatefulWidget {
  const ListSwipeToDismiss({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListSwipeToDismissState();
  }
}

class _ListSwipeToDismissState extends State<ListSwipeToDismiss> {
  final _items = List<String>.generate(20, (i) => "Değer \${i + 1}");

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final String item = _items[index];
         
        return Dismissible(
          key: Key(item),
         
          onDismissed: (DismissDirection dir) {
            setState(() => this._items.removeAt(index));
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(dir == DismissDirection.startToEnd
                    ? '\$item removed.'
                    : '\$item liked.'),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    setState(() => this._items.insert(index, item));
                  },
                ),
              ),
            );
          },
          
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete),
            alignment: Alignment.centerLeft,
          ),
        
          secondaryBackground: Container(
            color: Colors.green,
            child: Icon(Icons.thumb_up),
            alignment: Alignment.centerRight,
          ),
          child: ListTile(
            title: Center(child: Text('\${_items[index]}')),
          ),
        );
      },
    );
  }
}
 """;

  String reorderable = """
import 'package:flutter/material.dart';

class ReorderableList extends StatefulWidget {
  const ReorderableList({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ReorderableListState();
  }
}

class _ListItem {
  _ListItem(this.value, this.checked);
  final String value;
  bool checked;
}

class _ReorderableListState extends State<ReorderableList> {
  bool _reverseSort = false;
  static final _items = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
  ].map((item) => _ListItem(item, false)).toList();


  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final _ListItem item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });
  }


  void _onSort() {
    setState(() {
      _reverseSort = !_reverseSort;
      _items.sort((_ListItem a, _ListItem b) => _reverseSort
          ? b.value.compareTo(a.value)
          : a.value.compareTo(b.value));
    });
  }

  @override
  Widget build(BuildContext context) {
    final _appbar = AppBar(
      title: Text('Reorderable list'),
      automaticallyImplyLeading: false,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.sort_by_alpha),
          tooltip: 'Sort',
          onPressed: _onSort,
        ),
      ],
    );
    final _listTiles = _items
        .map(
          (item) => CheckboxListTile(
        key: Key(item.value),
        value: item.checked ?? false,
        onChanged: (bool newValue) {
          setState(() => item.checked = newValue);
        },
        title: Text('This item represents \${item.value}.'),
        isThreeLine: true,
        subtitle: Text('Item \${item.value}, checked=\${item.checked}'),
        secondary: Icon(Icons.drag_handle),
      ),
    )
        .toList();
    return Scaffold(
      appBar: _appbar,
      body: ReorderableListView(
        onReorder: _onReorder,
        children: _listTiles,
      ),
    );
  }
}
 """;

  String appbar = """
import 'package:flutter/material.dart';

class BasicAppbarExample extends StatelessWidget {
  const BasicAppbarExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(Icons.tag_faces),
        title: Text("Başlık"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.directions_bike),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.directions_bus),
            onPressed: () {},
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text('Boat')),
                PopupMenuItem(child: Text('Train'))
              ];
            },
          )
        ],
      ),
      body: Center(child: Text("Merhaba Flutter")),
    );
  }
}
 """;

  String bottonappbar = """
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomAppbar extends StatefulWidget {
  const BottomAppbar({Key key}) : super(key: key);

  @override
  _BottomAppbarState createState() => _BottomAppbarState();
}

class _BottomAppbarState extends State<BottomAppbar> {
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;
  bool _isBottomBarNotched = false;
  bool _isFabMini = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          ListTile(
            title: Text('FloatingActionButton position:'),
            trailing: DropdownButton<FloatingActionButtonLocation>(
              value: this._fabLocation,
              onChanged: (FloatingActionButtonLocation newVal) {
                if (newVal != null) {
                  setState(() => this._fabLocation = newVal);
                }
              },
              items: [
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.centerFloat,
                  child: Text('centerFloat'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.endFloat,
                  child: Text('endFloat'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.centerDocked,
                  child: Text('centerDocked'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.endDocked,
                  child: Text('endDocked'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.miniStartTop,
                  child: Text('miniStartTop'),
                ),
                DropdownMenuItem(
                  value: FloatingActionButtonLocation.startTop,
                  child: Text('startTop'),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Mini FAB:'),
            trailing: Switch(
              value: this._isFabMini,
              onChanged: (bool val) {
                setState(() => this._isFabMini = val);
              },
            ),
          ),
          ListTile(
            title: Text('BottomAppBar notch:'),
            trailing: Switch(
              value: this._isBottomBarNotched,
              onChanged: (bool val) {
                setState(() => this._isBottomBarNotched = val);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        mini: this._isFabMini,
        onPressed: () =>
            Fluttertoast.showToast(msg: 'Dummy floating action button'),
      ),
      floatingActionButtonLocation: this._fabLocation,
      bottomNavigationBar: this._buildBottomAppBar(context),
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      shape: this._isBottomBarNotched ? CircularNotchedRectangle() : null,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          // Bottom that pops up from the bottom of the screen.
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (BuildContext context) => Container(
                alignment: Alignment.center,
                height: 200,
                child: Text('Dummy bottom sheet'),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () =>
                Fluttertoast.showToast(msg: 'Dummy search action.'),
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => Fluttertoast.showToast(msg: 'Dummy menu action.'),
          ),
        ],
      ),
    );
  }
}
 """;

  String search = """
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as english_words;

class AppBarSearch extends StatefulWidget {
  const AppBarSearch({Key key}) : super(key: key);

  @override
  _AppBarSearchState createState() => _AppBarSearchState();
}

class _AppBarSearchState extends State<AppBarSearch> {
  final List<String> kEnglishWords;
  _MySearchDelegate _delegate;

  _AppBarSearchState()
      : kEnglishWords = List.from(Set.from(english_words.all))
    ..sort(
          (w1, w2) => w1.toLowerCase().compareTo(w2.toLowerCase()),
    ),
        super();

  @override
  void initState() {
    super.initState();
    _delegate = _MySearchDelegate(kEnglishWords);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('İngilizce Sözlük'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () async {
              final String selected = await showSearch<String>(
                context: context,
                delegate: _delegate,
              );
              if (selected != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You have selected the word: \$selected'),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: kEnglishWords.length,
          itemBuilder: (context, idx) => ListTile(
            title: Text(kEnglishWords[idx]),
          ),
        ),
      ),
    );
  }
}

// Defines the content of the search page in `showSearch()`.
// SearchDelegate has a member `query` which is the query string.
class _MySearchDelegate extends SearchDelegate<String> {
  final List<String> _words;
  final List<String> _history;

  _MySearchDelegate(List<String> words)
      : _words = words,
        _history = <String>['apple', 'hello', 'world', 'flutter'],
        super();

  // Leading icon in search bar.
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // SearchDelegate.close() can return vlaues, similar to Navigator.pop().
        this.close(context, null);
      },
    );
  }

  // Widget of result page.
  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('You have selected the word:'),
            GestureDetector(
              onTap: () {
                // Returns this.query as result to previous screen, c.f.
                // `showSearch()` above.
                this.close(context, this.query);
              },
              child: Text(
                this.query,
                style: Theme.of(context)
                    .textTheme
                    .display1
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Suggestions list while typing (this.query).
  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = this.query.isEmpty
        ? _history
        : _words.where((word) => word.startsWith(query));

    return _SuggestionList(
      query: this.query,
      suggestions: suggestions.toList(),
      onSelected: (String suggestion) {
        this.query = suggestion;
        this._history.insert(0, suggestion);
        showResults(context);
      },
    );
  }

  // Action buttons at the right of search bar.
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isEmpty
          ? IconButton(
        tooltip: 'Voice Search',
        icon: const Icon(Icons.mic),
        onPressed: () {
          this.query = 'TODO: implement voice input';
        },
      )
          : IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      )
    ];
  }
}

// Suggestions list widget displayed in the search page.
class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? Icon(Icons.history) : Icon(null),
          // Highlight the substring that matched the query.
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: textTheme.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: textTheme,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}
 """;

  String backdrop = """
import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

class Backdrop extends StatelessWidget {
  const Backdrop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      title: Text('Backdrop demo'),
      iconPosition: BackdropIconPosition.action,
      // Height of front layer when backlayer is shown.
      headerHeight: 120.0,
      frontLayer: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
                '(Ön Yüz) \n Arka yüzü görmek için sağ üst düğmeye tıklayın.\n\n'
                    "Bu Flutturın kendi widget ı değildir"
                    " 'backdrop' package.",style: TextStyle(fontSize: 18),),
          )),
      backLayer: Center(child: Text('(Arka Yüz)',style: TextStyle(fontSize: 22,color: Colors.white),)),
    );
  }
}
 """;

  String tabs = """ 
import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
      Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
      Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
      Center(child: Icon(Icons.account_circle, size: 64.0, color: Colors.tealAccent)),
    ];
    final _kTabs = <Tab>[
      Tab(icon: Icon(Icons.cloud,), text: 'Tab1'),
      Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
      Tab(icon: Icon(Icons.forum), text: 'Tab3'),
      Tab(icon: Icon(Icons.account_circle), text: 'Tab4'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Appbar Başlık'),
          backgroundColor: Colors.teal,

          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}
""";

  String dialogs = """
import 'package:flutter/material.dart';

class Dialogs extends StatelessWidget {
  const Dialogs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(32.0),
      children: <Widget>[
        ////// Alert dialog.
        RaisedButton(
            color: Colors.tealAccent,
            child: Text('Alert Dialog'),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Dialog title'),
                  content: Text(
                    'Örnek alert',
                  ),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Cancel'),
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                    ),
                    FlatButton(
                      child: Text('OK'),
                      onPressed: () => Navigator.pop(context, 'OK'),
                    ),
                  ],
                ),
              ).then((returnVal) {
                if (returnVal != null) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You clicked: \$returnVal'),
                      action: SnackBarAction(label: 'OK', onPressed: () {}),
                    ),
                  );
                }
              });
            }),
        ////// Simple Dialog.
        RaisedButton(
          color: Colors.cyan.shade200,
          child: Text('Simple dialog'),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => SimpleDialog(
                title: Text('Dialog Title'),
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('kullanıcı@example.com'),
                    onTap: () => Navigator.pop(context, 'kullanıcı@example.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('kullanıcı2@gmail.com'),
                    onTap: () => Navigator.pop(context, 'kullanıcı2@gmail.com'),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_circle),
                    title: Text('Yeni Kullanıcı'),
                    onTap: () => Navigator.pop(context, 'Yeni Kullanıcı'),
                  ),
                ],
              ),
            ).then((returnVal) {
              if (returnVal != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Tıkladığın: \$returnVal'),
                    action: SnackBarAction(label: 'Tamam', onPressed: () {}),
                  ),
                );
              }
            });
          },
        ),
        ////// Time Picker Dialog.
        RaisedButton(
          color: Colors.cyan.shade400,
          child: Text('Time Picker Dialog'),
          onPressed: () {
            DateTime now = DateTime.now();
            showTimePicker(
              context: context,
              initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
            ).then((TimeOfDay value) {
              if (value != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('\${value.format(context)}'),
                    action: SnackBarAction(label: 'OK', onPressed: () {}),
                  ),
                );
              }
            });
          },
        ),
        ////// Date Picker Dialog.
        RaisedButton(
          color: Colors.blue.shade900,
          child: Text('Date Picker Dialog',style: TextStyle(color: Colors.white),),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2018),
              lastDate: DateTime(2025),
            ).then((DateTime value) {
              if (value != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Selected datetime: \$value')),
                );
              }
            });
          },
        ),
        ////// Bottom Sheet Dialog.
        RaisedButton(
          color: Colors.teal.shade600,
          child: Text('Bottom Sheet'),
          onPressed: () {
            // Or: showModalBottomSheet(), with model bottom sheet, clicking
            // anywhere will dismiss the bottom sheet.
            showBottomSheet<String>(
              context: context,
              builder: (BuildContext context) => Container(
                decoration: BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black12)),
                ),
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: <Widget>[
                    ListTile(
                      dense: true,
                      title: Text('Bu bir alt sayfa'),
                    ),
                    ListTile(
                      dense: true,
                      title: Text("Kapatmak için 'Tamam'a tılayın"),
                    ),
                    ButtonBar(
                      children: <Widget>[
                        FlatButton(
                          child: const Text('Tamam'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ]
          .map(
            (Widget button) => Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: button,
        ),
      )
          .toList(),
    );
  }
}
 """;

  String navDrawer = """ 
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('Ahmet Faruk Turgut'),
      accountEmail: Text('ahmetfturgut@gmail.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
        backgroundColor: Colors.white,
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          child: Text('A',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.teal,
        ),
        CircleAvatar(
          child: Text('B',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.red,
        )
      ],
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: Text('1.Sayfa'),
          onTap: () => Navigator.of(context).push(_NewPage(1)),
        ),
        ListTile(
          title: Text('2. Sayfa'),
          onTap: () => Navigator.of(context).push(_NewPage(2)),
        ),
        ListTile(
          title: Text('Diğre sayfalar'),
          onTap: () {},
        ),
      ],
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Drawer Örnek'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Drawer'ı görmek için sol üst düğmeye basın veya ekranın solundan sağa doğru sürükleyin",style: TextStyle(fontSize: 22),),
          ),
        ),
        drawer: Drawer(
          child: drawerItems,
        ));
  }
}

// <Null> means this route returns nothing.
class _NewPage extends MaterialPageRoute<Null> {
  _NewPage(int id)
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sayfa \$id'),
        elevation: 1.0,
      ),
      body: Center(
        child: Text('Sayfa \$id'),
      ),
    );
  });
}
""";

  String bottomsheet = """
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({Key key}) : super(key: key);

  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  // GlobalKey is needed to show bottom sheet.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('bottom sheet Göster'),
              onPressed: () => this
                  ._scaffoldKey
                  .currentState
                  .showBottomSheet((ctx) => _buildBottomSheet(ctx)),
            ),
            RaisedButton(
              child: Text('modal bottom sheet Göster'),
              onPressed: () => showModalBottomSheet(
                  context: context, builder: (ctx) => _buildBottomSheet(ctx)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Fluttertoast.showToast(msg: 'Dummy floating action button'),
      ),
    );
  }

  Container _buildBottomSheet(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView(
        children: <Widget>[
          ListTile(title: Text('Bottom sheet')),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.attach_money),
              labelText: 'Integer değer girin',
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: RaisedButton.icon(
              icon: Icon(Icons.save),
              label: Text('Kaydet ve Kapat'),
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }
}
 """;

  String bottomtabbar = """
import 'package:flutter/material.dart';

class BottomTabbarExample extends StatefulWidget {
  const BottomTabbarExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomTabbarExampleState();
}

class _BottomTabbarExampleState extends State<BottomTabbarExample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  static const _kTabPages = <Widget>[
    Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
    Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
    Center(child: Icon(Icons.account_circle, size: 64.0, color: Colors.tealAccent)),
  ];
  static const _kTabs = <Tab>[
    Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
    Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
    Tab(icon: Icon(Icons.forum), text: 'Tab3'),
    Tab(icon: Icon(Icons.account_circle), text: 'Tab4'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }


  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: TabBarView(
        children: _kTabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
        ),
      ),
    );
  }
}
 """;

  String pageselector = """
import 'package:flutter/material.dart';

class PageSelector extends StatelessWidget {
  const PageSelector({Key key}) : super(key: key);

  static const kIcons = <Icon>[
    Icon(Icons.event),
    Icon(Icons.home),
    Icon(Icons.android),
    Icon(Icons.alarm),
    Icon(Icons.face),
    Icon(Icons.language),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: kIcons.length,
      // Use a Builder here, otherwise `DefaultTabController.of(context)` below
      // returns null.
      child: Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TabPageSelector(),
              Expanded(
                child: IconTheme(
                  data: IconThemeData(
                    size: 128.0,
                    color: Theme.of(context).accentColor,
                  ),
                  child: TabBarView(children: kIcons),
                ),
              ),
              RaisedButton(
                child: Text('ATLA'),
                onPressed: () {
                  final TabController controller =
                  DefaultTabController.of(context);
                  if (!controller.indexIsChanging) {
                    controller.animateTo(kIcons.length - 1);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
 """;
//   String timeseriesChartExample = """
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

// /// Data class to visualize.
// class _SalesData {
//   final int year;
//   final int sales;

//   _SalesData(this.year, this.sales);
//   // Returns Jan.1st of that year as date.
//   DateTime get date => DateTime(this.year);
// }

// /// Generate some random data.
// List<_SalesData> _genRandData() {
//   final random = Random();
//   // Returns an increasing series with some fluctuations.
//   return [
//     for (int i = 2005; i < 2020; ++i)
//       _SalesData(i, (i - 2000) * 40 + random.nextInt(100)),
//   ];
// }

// class TimeseriesChartExample extends StatefulWidget {
//   const TimeseriesChartExample({Key key}) : super(key: key);

//   @override
//   _TimeseriesChartExampleState createState() => _TimeseriesChartExampleState();
// }

// class _TimeseriesChartExampleState extends State<TimeseriesChartExample> {
//   // Chart configs.
//   bool _animate = true;
//   bool _defaultInteractions = true;
//   bool _includeArea = true;
//   bool _includePoints = true;
//   bool _stacked = true;
//   charts.BehaviorPosition _titlePosition = charts.BehaviorPosition.bottom;
//   charts.BehaviorPosition _legendPosition = charts.BehaviorPosition.bottom;

//   // Data to render.
//   List<_SalesData> _series1, _series2;

//   @override
//   void initState() {
//     super.initState();
//     this._series1 = _genRandData();
//     this._series2 = _genRandData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(8),
//       children: <Widget>[
//         SizedBox(
//           height: 300,
//           child: charts.TimeSeriesChart(
//             /*seriesList=*/ [
//               charts.Series<_SalesData, DateTime>(
//                 id: 'Sales-1',
//                 colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//                 domainFn: (_SalesData sales, _) => sales.date,
//                 measureFn: (_SalesData sales, _) => sales.sales,
//                 data: this._series1,
//               ),
//               charts.Series<_SalesData, DateTime>(
//                 id: 'Sales-2',
//                 colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
//                 domainFn: (_SalesData sales, _) => sales.date,
//                 measureFn: (_SalesData sales, _) => sales.sales,
//                 data: this._series2,
//               ),
//             ],
//             defaultInteractions: this._defaultInteractions,
//             defaultRenderer: charts.LineRendererConfig(
//               includePoints: this._includePoints,
//               includeArea: this._includeArea,
//               stacked: this._stacked,
//             ),
//             animate: this._animate,
//             behaviors: [
//               // Add title.
//               charts.ChartTitle('Dummy sales time series',
//                   behaviorPosition: _titlePosition),
//               // Add legend.
//               charts.SeriesLegend(position: _legendPosition),
//               // Highlight X and Y value of selected point.
//               charts.LinePointHighlighter(
//                 showHorizontalFollowLine:
//                     charts.LinePointHighlighterFollowLineType.all,
//                 showVerticalFollowLine:
//                     charts.LinePointHighlighterFollowLineType.nearest,
//               ),
//             ],
//           ),
//         ),
//         const Divider(),
//         ..._controlWidgets(),
//       ],
//     );
//   }

//   /// Widgets to control the chart appearance and behavior.
//   List<Widget> _controlWidgets() => <Widget>[
//         SwitchListTile(
//           title: const Text('animate'),
//           onChanged: (bool val) => setState(() => this._animate = val),
//           value: this._animate,
//         ),
//         SwitchListTile(
//           title: const Text('defaultInteractions'),
//           onChanged: (bool val) =>
//               setState(() => this._defaultInteractions = val),
//           value: this._defaultInteractions,
//         ),
//         SwitchListTile(
//           title: const Text('includePoints'),
//           onChanged: (bool val) => setState(() => this._includePoints = val),
//           value: this._includePoints,
//         ),
//         SwitchListTile(
//           title: const Text('includeArea'),
//           onChanged: (bool val) => setState(() => this._includeArea = val),
//           value: this._includeArea,
//         ),
//         SwitchListTile(
//           title: const Text('stacked'),
//           onChanged: (bool val) => setState(() => this._stacked = val),
//           value: this._stacked,
//         ),
//         ListTile(
//           title: const Text('titlePosition:'),
//           trailing: DropdownButton<charts.BehaviorPosition>(
//             value: this._titlePosition,
//             onChanged: (charts.BehaviorPosition newVal) {
//               if (newVal != null) {
//                 setState(() => this._titlePosition = newVal);
//               }
//             },
//             items: [
//               for (final val in charts.BehaviorPosition.values)
//                 DropdownMenuItem(value: val, child: Text('\${(val)'))
//             ],
//           ),
//         ),
//         ListTile(
//           title: const Text('legendPosition:'),
//           trailing: DropdownButton<charts.BehaviorPosition>(
//             value: this._legendPosition,
//             onChanged: (charts.BehaviorPosition newVal) {
//               if (newVal != null) {
//                 setState(() => this._legendPosition = newVal);
//               }
//             },
//             items: [
//               for (final val in charts.BehaviorPosition.values)
//                 DropdownMenuItem(value: val, child: Text('\${(val)'))
//             ],
//           ),
//         ),
//       ];
// }

//  """;
}
