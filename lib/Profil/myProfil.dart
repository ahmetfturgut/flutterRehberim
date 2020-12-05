import 'package:flutter/material.dart';
import 'package:flutter_rehberim/utils.dart';
import 'package:flutter_rehberim/utils/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:android_intent/android_intent.dart';

class MyProfil extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile7.dart";

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserRepository userRepo, child) => Scaffold(
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 230,
                  ),
                  Positioned(
                    top: 10,
                    right: 30,
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        height: 130,
                        margin: EdgeInsets.only(top: 60),
                        child: Image(
                          image: new AssetImage('assets/images/avatar.jpg'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      Text(
                        "Ahmet Faruk Turgut",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 48.0),
                        child: UserInfo(userRepo: userRepo),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  var userRepo;
  UserInfo({this.userRepo});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Card(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column(
                children: <Widget>[
                  Container(
                      child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("About Me"),
                        subtitle: Text("Software Developer."),
                      ),
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        leading: Icon(Icons.my_location),
                        title: Text("İstanbul"),
                        subtitle: Text("Türkiye"),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Email"),
                        subtitle: Text(
                          "a.farukturgut@gmail.com",
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final AndroidIntent intent = AndroidIntent(
                              action: 'action_view',
                              data: Uri.encodeFull(
                                  'https://play.google.com/store/apps/developer?id=afturgut&hl=tr'),
                              package: 'com.google.android.apps.maps');
                          intent.launch();
                        },
                        child: ListTile(
                          leading: Icon(Icons.apps),
                          title: Text("Uygulamalarım"),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          final RenderBox box = context.findRenderObject();
                          Share.share(GOOGLEPLAY_URL,
                              subject: "Flutter UI Project",
                              sharePositionOrigin:
                                  box.localToGlobal(Offset.zero) & box.size);
                        },
                        child: ListTile(
                          leading: Icon(Icons.share),
                          title: Text("Uygulamayı Paylaş"),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
