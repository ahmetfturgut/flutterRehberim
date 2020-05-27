import 'package:flutter/material.dart';
import 'package:flutter_rehberim/demo/login1/forgot_pass1.dart';
import 'package:flutter_rehberim/demo/login1/register_page1.dart';

class LoginPage2 extends StatefulWidget {
  var modeDark;
  LoginPage2({this.modeDark});
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  var isActive = true;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 280,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      alignment: Alignment.bottomCenter,
                      image: new AssetImage('assets/images/corono.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 255),
                    child: Center(
                      child: Card(
                        color: Color(0xFFe4f2f0),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 4, bottom: 4, left: 4, right: 4),
                          child: Image.asset(
                            'assets/images/github.png',
                            height: 50,
                            width: 220,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 5,
                      ),
                    )),
              ],
            ),
            Padding(
                padding:
                    EdgeInsets.only(left: 17, right: 17, top: 50, bottom: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                                topLeft: const Radius.circular(6.0),
                                topRight: const Radius.circular(6.0))),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 6, bottom: 6),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "E-mail",
                                hintStyle: TextStyle(
                                    color: Color(0xFF4683F8), fontSize: 14)),
                          ),
                        )),
                    Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Divider(
                            color: Colors.grey[200],
                          ),
                        )),
                    Container(
                        decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: new BorderRadius.only(
                                bottomLeft: const Radius.circular(6.0),
                                bottomRight: const Radius.circular(6.0))),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 6, bottom: 6),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Şifre",
                                hintStyle: TextStyle(
                                    color: Color(0xFF4683F8), fontSize: 14)),
                          ),
                        ))
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                          color: Color(0xFF3b5998),
                          offset: Offset(0.0, 2.0),
                        ),
                      ],
                      color: Color(0xFF3b5998),
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/facebook_logo.png',
                          height: 34,
                          width: 34,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4, right: 6),
                          child: Text(
                            'Facebook ile giriş',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    )),
                Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                          color: Color(0xFF4683F8),
                          offset: Offset(0.0, 2.0),
                        ),
                      ],
                      color: Color(0xFF4683F8),
                    ),
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/google_logo.png',
                          height: 34,
                          width: 34,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4, right: 6),
                          child: Text(
                            'Google ile giriş',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: ButtonTheme(
                    minWidth: 130.0,
                    height: 40.0,
                    child: RaisedButton(
                      color: Color(0xff394a6d),
                      onPressed: () {},
                      child: const Text('Giriş',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(6.0)),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
          ],
        ));
  }
}
