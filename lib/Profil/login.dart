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
    super.initState();

    _email = TextEditingController(text: "");
    _sifre = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    final userRepo = Provider.of<UserRepository>(context);
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 88.0),
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
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: RaisedButton(
                          onPressed: () {
                            userRepo.signInWithGoogle(_email.text, _sifre.text);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset("assets/images/google-logo.png"),
                              Padding(
                                padding: const EdgeInsets.only(left: 38.0),
                                child: Text(
                                  "Gmail ile Giriş Yap",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: RaisedButton(
                          onPressed: () {
                            userRepo.signInWithFacebook(
                                _email.text, _sifre.text);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/facebook-logo.png",
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 38.0),
                                child: Text(
                                  "Facebook ile Giriş Yap",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          color: Color(0xFF334D92),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: RaisedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  fullscreenDialog: true,
                                  builder: (context) => MyRegisterPage(),
                                ),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.email),
                                Padding(
                                  padding: const EdgeInsets.only(left: 38.0),
                                  child: Text(
                                    "Email ve Şifre ile Giriş yap",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            color: Color(0xFFC3B59B)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
