import 'package:flutter/material.dart';
import 'package:flutter_rehberim/demo/login1/forgot_pass1.dart';
import 'package:flutter_rehberim/demo/login1/register_page1.dart';

class LoginPage1 extends StatefulWidget {
  var modeDark;
  LoginPage1({this.modeDark});
  @override
  _LoginPage1State createState() => _LoginPage1State();
}

class _LoginPage1State extends State<LoginPage1> {
  var isActive = true;
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.modeDark?Color(0xffb353353):Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80.0),
                      bottomRight: Radius.circular(80.0),
                    ),
                    color: Colors.blue),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.33,
                child: Padding(
                  padding: const EdgeInsets.only(left: 38, top: 130),
                  child: Text(
                    "Giriş",
                    style: TextStyle(fontSize: 42, color: Colors.white),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Form(
                    key: formKey,
                      child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 38, vertical: 55),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            hintText: "abc@gabc.abc",
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 38, vertical: 5),
                        child: TextFormField(
                          obscureText: isActive,
                          decoration: InputDecoration(
                            labelText: "Şifre",
                            suffixIcon: InkWell(
                                onTap: () {
                                  setState(() {
                                    isActive = !isActive;
                                  });
                                },
                                child: Icon(Icons.lock)),
                          ),
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 215, top: 15),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ForgotPas1(modeDark:widget.modeDark)));
                          },
                          child: Text(
                            "Şifremi Unuttum",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: RaisedButton(

                          onPressed: () {},
                          color: Colors.green,
                          elevation: 5,
                          child: Text("GİRİŞ YAP"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterPage1(modeDark: widget.modeDark,)));
                          },
                          child: Text(
                            "KAYIT OL",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      )
                    ],
                  )),
                ),
              )
            ],
          ),
        ));
  }
}
