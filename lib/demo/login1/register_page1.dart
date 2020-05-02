import 'package:flutter/material.dart';
import 'package:flutter_rehberim/demo/login1/login_page1.dart';

class RegisterPage1 extends StatefulWidget {
  var modeDark;
  RegisterPage1({this.modeDark});
  @override
  _RegisterPage1State createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
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
                    "Kayıt Ol",
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
                                horizontal: 38, vertical: 15),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "Ad Soyad",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 38),
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
                                horizontal: 38),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "Email Tekrar",
                                hintText: "abc@gabc.abc",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 38),
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 38),
                            child: TextFormField(
                              obscureText: isActive,
                              decoration: InputDecoration(
                                labelText: "Şifre Tekrar",
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
                            padding: const EdgeInsets.only(top: 40),
                            child: RaisedButton(

                              onPressed: () {},
                              color: Colors.green,
                              elevation: 5,
                              child: Text("KAYIT OL"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginPage1(modeDark:widget.modeDark)));
                              },
                              child: Text(
                                "GİRİŞ YAP",
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
