import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rehberim/utils.dart';
import 'package:flutter_rehberim/utils/user_repository.dart';

import 'package:flushbar/flushbar.dart';

class MyRegisterPage extends StatefulWidget {
  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  var isActive = true;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _email;
  TextEditingController _sifre;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _email = TextEditingController(text: "");
    _sifre = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final userRepo = Provider.of<UserRepository>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.only(top: 58.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: kAppIcon,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _email,
                            validator: (deger) {
                              if (deger.length <= 0) {
                                return "lütfen alanı doldurunuz";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: TextFormField(
                            obscureText: isActive,
                            controller: _sifre,
                            validator: (deger) {
                              if (deger.length <= 0) {
                                return "lütfen alanı doldurunuz";
                              }
                            },
                            decoration: InputDecoration(
                                suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isActive = !isActive;
                                      });
                                    },
                                    child: Icon(Icons.lock)),
                                labelText: "Şifre",
                                border: OutlineInputBorder()),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: RaisedButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                if (!await userRepo.signUp(
                                    _email.text, _sifre.text)) {
                                  Flushbar(
                                      icon: Icon(Icons.error,color: Colors.blue,),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    title: "HATAAAAAA",
                                    message:
                                        "Girdiğiniz Email hatalı veya kullanılıyor",
                                    duration: Duration(seconds: 5),
                                    isDismissible: false,
                                  )..show(context);
                                } else {
                                  Navigator.pop(context);
                                }
                              }
                            },
                            child: Text(
                              "Kayıt ol",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.green,
                          ),
                        ),
                        Center(
                          child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Giriş",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 18),
                                  ))),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
