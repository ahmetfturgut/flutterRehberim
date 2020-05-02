import 'package:flutter/material.dart';
 
import 'package:flutter_rehberim/demo/login1/login_page1.dart';
import 'package:flutter_rehberim/demo/login2/login_page2.dart';
import 'package:flutter_rehberim/demo/login3/login_page3.dart';
import 'package:flutter_rehberim/demo/login4/login_page4.dart';
 

class MyDemo extends StatefulWidget {
  var modeDark;
  MyDemo({this.modeDark});
  @override
  _MyDemoState createState() => _MyDemoState();
}

class _MyDemoState extends State<MyDemo> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                childAspectRatio: (itemWidth / itemHeight),
                crossAxisCount: 2,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              LoginPage1(modeDark: widget.modeDark)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        
                        padding: new EdgeInsets.all(11.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                            image: AssetImage("assets/images/ekran1.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 500,
                        width: 500,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              LoginPage2(modeDark: widget.modeDark)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                            image: AssetImage("assets/images/ekran2.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 500,
                        width: 500,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPage3(modeDark: widget.modeDark)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                            image: AssetImage("assets/images/ekran3.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPage4()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                            image: AssetImage("assets/images/ekran4.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                ],
              )),
        ],
      ),
    );
  }
}
