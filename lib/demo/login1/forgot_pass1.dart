import 'package:flutter/material.dart';
import 'package:flutter_rehberim/demo/login1/login_page1.dart';
import 'package:flutter_rehberim/demo/login1/register_page1.dart';

class ForgotPas1 extends StatefulWidget {
  var modeDark;
  ForgotPas1({this.modeDark});
  @override
  _ForgotPas1State createState() => _ForgotPas1State();
}

class _ForgotPas1State extends State<ForgotPas1> {
  var isActive = true;
  var formKey = GlobalKey<FormState>();

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 38, top: 110),
                        child: Text(
                          "Şifre ",
                          style: TextStyle(fontSize: 42, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:71),
                        child: Text(
                          "Yenile ",
                          style: TextStyle(fontSize: 42, color: Colors.white),
                        ),
                      ),
                    ],
                  )),
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
                            padding: const EdgeInsets.only(top: 80),
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.green,
                              elevation: 5,
                              child: Text("GÖNDER"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginPage1(modeDark: widget.modeDark,)));
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
