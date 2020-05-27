import 'package:flutter/material.dart';
import 'package:flutter_rehberim/Profil/register.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rehberim/utils.dart';
import 'package:flutter_rehberim/utils/user_repository.dart';
import 'package:flushbar/flushbar.dart';
class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
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
        padding: const EdgeInsets.only(top: 28.0),
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
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(22.0),
                          child: RaisedButton(
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                if (!await userRepo.signIn(
                                    _email.text, _sifre.text)) {
                                  Flushbar(
                                       icon: Icon(Icons.error,color: Colors.blue,),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    title: "HATAAAAAA",
                                    message:
                                        "Hatalı Email veya Şifre",
                                    duration: Duration(seconds: 5),
                                    isDismissible: false,
                                  )..show(context);
                                }
                              }
                            },
                            child: Text(
                              "Giriş Yap",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                          ),
                        ),
                        Center(
                          child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MyRegisterPage()));
                                  },
                                  child: Text(
                                    "Kayıt Ol",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 18),
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
