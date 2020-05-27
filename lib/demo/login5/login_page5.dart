import 'package:flutter/material.dart';

class LoginPage5 extends StatefulWidget {
  @override
  _LoginPage5State createState() => _LoginPage5State();
}

class _LoginPage5State extends State<LoginPage5> {
  var isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/duvar.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Theme(
            data: ThemeData(
                primaryColor: Color(0xFFC9A538),
                primaryColorDark: Color(0xFFC9A538),
                hintColor: Color(0xFFC9A538),
                cursorColor: Color(0xFFC9A538),
                accentColor: Color(0xFFC9A538)),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 300, left: 0),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 45, vertical: 12),
                    child: TextField(
                      style: TextStyle(color: Color(0xFFC9A538)),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          helperText: "Lütfen Email Adresinizi Giriniz",
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Color(0xFFC9A538)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xFFC9A538),
                          ),
                          suffixStyle: TextStyle(color: Color(0xFFC9A538))),
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 12),
                  child: TextField(
                    style: TextStyle(color: Color(0xFFC9A538)),
                    obscureText: isActive,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      helperText: "Lütfen Şifrenizi Giriniz",
                      labelText: 'Şifre',
                      labelStyle: TextStyle(color: Color(0xFFC9A538)),
                      suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isActive = !isActive;
                            });
                          },
                          child: Icon(
                            Icons.lock,
                            color: Color(0xFFC9A538),
                          )),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xFFC9A538),
                      ),
                      suffixStyle: TextStyle(
                        color: Color(0xFFC9A538),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 165),
                  child: RaisedButton(
                    padding: EdgeInsets.only(left: 34, right: 34),
                    onPressed: () {},
                    color: Color(0xFFC9A538),
                    child: Text(
                      "GİRİŞ",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 130, left: 60),
          child: RotatedBox(
            quarterTurns: -1,
            child: Text(
              'GİRİŞ',
              style: TextStyle(
                color: Color(0xFFC9A538),
                fontSize: 38,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 180,left: 170),
            child: Text(
              "LOGO",
              style: TextStyle(
                color: Color(0xFFC9A538),
                fontSize: 38,
              ),
            )),
      ],
    ));
  }
}
