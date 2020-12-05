import 'dart:ui';
import 'dart:wasm';

import 'package:flutter/material.dart';
import 'package:flutter_rehberim/Profil/myProfilRouter.dart';
import 'package:flutter_rehberim/about.dart';
import 'package:flutter_rehberim/my_body.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter_rehberim/my_advenced.dart';
import 'package:flutter_rehberim/my_demo.dart';
import 'package:flutter_rehberim/themes.dart';
import 'package:flutter_rehberim/utils/user_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentTabIndex = 0;
  bool modeDark = false;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserRepository>(
            create: (context) => UserRepository()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Rehberi',
        theme: modeDark ? kDarkTheme : kLightTheme,
        home: BackdropScaffold(
          title: Text('Flutter Rehberi'),
          iconPosition: BackdropIconPosition.action,
          headerHeight: 1.0,
          frontLayer: Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(modeDark ? Icons.brightness_4 : Icons.brightness_7),
              onPressed: () {
                setState(() {
                  modeDark = !modeDark;
                });
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  //backgroundColor: Colors.blue,
                  backgroundColor:
                      modeDark ? Color(0xFF616161) : Color(0xFFC3B89B),
                  icon: Icon(Icons.library_books),
                  title: Text('Temel'),
                ),
                BottomNavigationBarItem(
                  backgroundColor:
                      modeDark ? Color(0xFF757575) : Color(0xFFC3B59B),
                  icon: Icon(Icons.insert_chart),
                  title: Text('İleri'),
                ),
                BottomNavigationBarItem(
                  backgroundColor:
                      modeDark ? Color(0xFF757575) : Color(0xFFC3B59B),
                  icon: Icon(Icons.developer_board),
                  title: Text('Demo'),
                ),
                BottomNavigationBarItem(
                  backgroundColor:
                      modeDark ? Color(0xFF757575) : Color(0xFFC3B59B),
                  icon: Icon(Icons.account_circle),
                  title: Text('Profil'),
                ),
              ],
              currentIndex: _currentTabIndex,
              type: BottomNavigationBarType.shifting,
              onTap: (int index) {
                setState(() => this._currentTabIndex = index);
              },
            ),
            // floatingActionButton: MyFloatingActionButton(),
            body: Stack(
              children: <Widget>[
                Container(
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: IndexedStack(
                      children: <Widget>[
                        MyBasic(),
                        MyAdvenced(),
                        MyDemo(modeDark: modeDark),
                        MyProfilRouter()
                      ],
                      index: _currentTabIndex,
                    ),
                  ),
                )
              ],
            ),
          ),
          backLayer: Center(
              child: ListView(
            children: <Widget>[
              MyAbout.header,
              ...MyAbout.kAboutListTiles,
            ],
          )),
        ),
      ),
    );
  }
}
