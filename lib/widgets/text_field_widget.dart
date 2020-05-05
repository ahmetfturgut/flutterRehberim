import 'package:flutter/material.dart';
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
        labelText: 'Integer değer giriniz:',
        errorText: _numberInputIsValid ? null : 'Lütfen Integer değer giriniz!',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      onSubmitted: (val) =>
          Fluttertoast.showToast(msg: 'Girilen: \${int.parse(val)}'),
      onChanged: (String val) {
        final v = int.tryParse(val); 
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
        counterText: '\${this._controller.text.split(' ').length} kelimeler',
        labelText: 'Çok satır giriniz:',
        hintText: 'birşeyler yazınızz...',
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
        labelText: 'Şifre',
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
      decoration: InputDecoration.collapsed(hintText: 'Kenarlıksız giriş'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        ListTile(title: Text('1. Sayı girişi alanı')),
        _buildNumberTextField(),
        ListTile(title: Text('2. Çok satırlı giriş alanı')),
        _buildMultilineTextField(),
        ListTile(title: Text('3. Şifre girişi alanı')),
        _buildPasswordTextField(),
        ListTile(title: Text('4. Kenarlıksız giriş')),
        _buildBorderlessTextField(),
      ],
    );
  }
}
