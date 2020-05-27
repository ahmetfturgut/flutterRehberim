import 'dart:ui';

import 'package:flutter/material.dart'; 
import 'package:flutter_rehberim/Profil/myProfilRouter.dart';
import 'package:flutter_rehberim/my_body.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter_rehberim/my_advenced.dart';
import 'package:flutter_rehberim/my_demo.dart';
import 'package:flutter_rehberim/themes.dart';
import 'package:flutter_rehberim/utils/user_repository.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:provider/provider.dart';
import './utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final List<Widget> kAboutListTiles = <Widget>[
    ListTile(
      title: Text(APP_DESCRIPTION),
    ),
    Divider(),
    ListTile(
      leading: Icon(Icons.bug_report),
      title: Text('GitHub Hesabım'),
      onTap: () => url_launcher.launch('$GITHUB_URL'),
    ),
    ListTile(
      leading: Icon(Icons.open_in_new),
      title: Text('Kişisel Web Sitem'),
      onTap: () => url_launcher.launch(AUTHOR_SITE),
    ),
    ListTile(
      leading: Icon(Icons.shop),
      title: Text('Google Play'),
      onTap: () => url_launcher.launch(GOOGLEPLAY_URL),
    ),
  ];

  final header = ListTile(
    leading: kAppIcon,
    title: Text(APP_NAME),
    subtitle: Text(APP_VERSION),
  );

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
          headerHeight: 120.0,
          frontLayer: Scaffold(
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
              header,
              ...kAboutListTiles,
              ListTile(
                leading:
                    Icon(modeDark ? Icons.brightness_4 : Icons.brightness_7),
                title: Text("Karanlık Mod"),
                trailing: Switch(
                  onChanged: (bool value) {
                    setState(() {
                      modeDark = value;
                    });
                  },
                  value: modeDark,
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
