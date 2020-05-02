import 'package:flutter/material.dart';

class LoginPage4 extends StatefulWidget {
  @override
  _LoginPage4State createState() => _LoginPage4State();
}

class _LoginPage4State extends State<LoginPage4> {
  var isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/grey.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 350, left: 0),
                child: Text(
                  "GİRİŞ",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                  child: new Theme(
                    data: new ThemeData(
                      primaryColor: Colors.black,
                      primaryColorDark: Colors.black,
                    ),
                    child: new TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(44)),
                              borderSide:
                                  new BorderSide(color: Color(0xffbFFA269))),
                          hintText: 'Email',
                          helperText: "Lütfen Email Adresinizi Giriniz",
                          labelText: 'Email',
                          prefixIcon: const Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          suffixStyle: const TextStyle(color: Colors.black)),
                    ),
                  )),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                  child: new Theme(
                    data: new ThemeData(
                      primaryColor: Colors.black,
                      primaryColorDark: Colors.black,
                    ),
                    child: new TextFormField(
                      obscureText: isActive,
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(44)),
                              borderSide:
                                  new BorderSide(color: Color(0xffbFFA269))),
                          hintText: 'Şifre',
                          helperText: "Lütfen Şifrenizi Giriniz",
                          labelText: 'Şifre',
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isActive = !isActive;
                                });
                              },
                              child: Icon(Icons.lock)),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          suffixStyle: const TextStyle(color: Colors.black)),
                    ),
                  )),
              RaisedButton(
                padding: EdgeInsets.only(left: 34, right: 34),
                
                onPressed: () {},
                color: Color(0xffbFFA269),
                child: Text("GİRİŞ",style: TextStyle(color: Colors.black),),
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/avatar123.gif"),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(200.0),
              bottomRight: Radius.circular(200.0),
            ),
          ),
        ),
      ],
    ));
  }
}
