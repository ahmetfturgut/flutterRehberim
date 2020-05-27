import 'package:flutter/material.dart';

class LoginPage3 extends StatelessWidget {
  var modeDark;
  LoginPage3({this.modeDark});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              image: DecorationImage(
                alignment: Alignment.bottomCenter,
                image: AssetImage('assets/images/person4.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 240, left: 40),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                // color:modeDark? Color(0xFFC3B59B):Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0, // has the effect of softening the shadow
                    spreadRadius: 2.0, // has the effect of extending the shadow
                    offset: Offset(
                      0.5, // horizontal, move right 10
                      0.5, // vertical, move down 10
                    ),
                  )
                ],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Telefon",
                        hintText: "10 Haneli Telefon Numarası",
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.blue)),
                        onPressed: () {},
                        padding: EdgeInsets.only(left: 84, right: 84),
                        child: Text("GİRİŞ YAP"),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
