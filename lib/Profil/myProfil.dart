import 'package:flutter/material.dart';
import 'package:flutter_rehberim/utils.dart';
import 'package:flutter_rehberim/utils/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class MyProfil extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile7.dart";

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, UserRepository userRepo, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(
            "Çıkış",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            userRepo.signOut();
          },
        ),
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
                        userRepo.user.email,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                      ),

                      // Container(
                      //   margin: EdgeInsets.only(top: 77),
                      //   padding: EdgeInsets.all(10),
                      //   child: Card(
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //       children: <Widget>[
                      //         Column(
                      //           children: <Widget>[
                      //             Container(
                      //                 padding:
                      //                     EdgeInsets.only(top: 15, bottom: 5),
                      //                 child: Text("Photos",
                      //                     style: TextStyle(
                      //                         color: Colors.black54))),
                      //             Container(
                      //                 padding: EdgeInsets.only(bottom: 15),
                      //                 child: Text("5,000",
                      //                     style: TextStyle(
                      //                         color: Colors.black87,
                      //                         fontSize: 16))),
                      //           ],
                      //         ),
                      //         Column(
                      //           children: <Widget>[
                      //             Container(
                      //                 padding:
                      //                     EdgeInsets.only(top: 15, bottom: 5),
                      //                 child: Text("Followers",
                      //                     style: TextStyle(
                      //                         color: Colors.black54))),
                      //             Container(
                      //                 padding: EdgeInsets.only(bottom: 15),
                      //                 child: Text("5,000",
                      //                     style: TextStyle(
                      //                         color: Colors.black87,
                      //                         fontSize: 16))),
                      //           ],
                      //         ),
                      //         Column(
                      //           children: <Widget>[
                      //             Container(
                      //                 padding:
                      //                     EdgeInsets.only(top: 10, bottom: 5),
                      //                 child: Text("Followings",
                      //                     style: TextStyle(
                      //                         color: Colors.black54))),
                      //             Container(
                      //                 padding: EdgeInsets.only(bottom: 10),
                      //                 child: Text("5,000",
                      //                     style: TextStyle(
                      //                         color: Colors.black87,
                      //                         fontSize: 16))),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
                    alignment: Alignment.topLeft,
                    child: Center(
                      child: Text(
                        "Kullanıcı",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Container(
                      child: Column(
                    children: <Widget>[
                      // ListTile(
                      //   contentPadding:
                      //       EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      //   leading: Icon(Icons.my_location),
                      //   title: Text("Location"),
                      //   subtitle: Text("Kathmandu"),
                      // ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("Email"),
                        subtitle: Text(
                          userRepo.user.email,
                        ),
                      ),
                      ListTile(
                          leading: Icon(Icons.share),
                          title: Text("Uygulamayı Paylaş"),
                          trailing: InkWell(
                            onTap: (){
                              // A builder is used to retrieve the context immediately
                              // surrounding the RaisedButton.
                              //
                              // The context's `findRenderObject` returns the first
                              // RenderObject in its descendent tree when it's not
                              // a RenderObjectWidget. The RaisedButton's RenderObject
                              // has its position and size after it's built.
                              final RenderBox box = context.findRenderObject();
                              Share.share(GOOGLEPLAY_URL,
                                  subject: "Flutter UI Project",
                                  sharePositionOrigin:
                                      box.localToGlobal(Offset.zero) &
                                          box.size);
                            },
                            child: Icon(Icons.arrow_forward),
                          )),
                      // ListTile(
                      //   leading: Icon(Icons.person),
                      //   title: Text("About Me"),
                      //   subtitle: Text(
                      //       "This is a about me link and you can khow about me in this section."),
                      // ),
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
