import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_rehberim/Profil/myProfilRouter.dart';
import 'package:flutter_rehberim/chat.dart';
import 'package:flutter_rehberim/my_body.dart';
import 'package:flutter_rehberim/my_advenced.dart';
import 'package:flutter_rehberim/my_demo.dart';
import 'package:flutter_rehberim/themes.dart';
import 'package:flutter_rehberim/utils/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:package_info/package_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );
  int _currentTabIndex = 0;
  bool modeDark = false;
  @override
  void initState() {
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserRepository>(
            create: (context) => UserRepository()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: modeDark ? kDarkTheme : kLightTheme,
          home: Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_packageInfo.appName),
                  Text(_packageInfo.version),
                ],
              ),
              backgroundColor: Color(0xFFFAFBFD),
              elevation: 0,
            ),
            floatingActionButton: _currentTabIndex == 2
                ? null
                : FloatingActionButton(
                    child: Icon(
                        modeDark ? Icons.brightness_4 : Icons.brightness_7),
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
                      modeDark ? Color(0xFF616161) : Color(0xFFFAFBFD),
                  icon: Icon(Icons.library_books,
                      color: _currentTabIndex == 0
                          ? Color(0xFF86F0C3)
                          : Colors.black),
                  title:
                      Text('Temel', style: TextStyle(color: Color(0xFF86F0C3))),
                ),
                BottomNavigationBarItem(
                  backgroundColor:
                      modeDark ? Color(0xFF757575) : Color(0xFFFAFBFD),
                  icon: Icon(Icons.insert_chart,
                      color: _currentTabIndex == 1
                          ? Color(0xFFFEE38F)
                          : Colors.black),
                  title:
                      Text('İleri', style: TextStyle(color: Color(0xFFFEE38F))),
                ),
                BottomNavigationBarItem(
                  backgroundColor:
                      modeDark ? Color(0xFF757575) : Color(0xFFFAFBFD),
                  icon: Icon(Icons.question_answer,
                      color: _currentTabIndex == 2
                          ? Color(0xFFA7D9F7)
                          : Colors.black),
                  title:
                      Text('Chat', style: TextStyle(color: Color(0xFFA7D9F7))),
                ),
                BottomNavigationBarItem(
                  backgroundColor:
                      modeDark ? Color(0xFF757575) : Color(0xFFFAFBFD),
                  icon: Icon(Icons.developer_board,
                      color: _currentTabIndex == 3
                          ? Color(0xFFFCC7AA)
                          : Colors.black),
                  title:
                      Text('Demo', style: TextStyle(color: Color(0xFFFCC7AA))),
                ),
                BottomNavigationBarItem(
                  backgroundColor:
                      modeDark ? Color(0xFF757575) : Color(0xFFFAFBFD),
                  icon: new Image.asset('assets/images/man.png',
                      height: 30, fit: BoxFit.fitWidth),
                  title: Text(
                    'AFT',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
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
                  decoration: BoxDecoration(color: Color(0xFFFAFBFD)),
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                    child: IndexedStack(
                      children: <Widget>[
                        MyBasic(),
                        MyAdvenced(),
                        Chat(),
                        MyDemo(modeDark: modeDark),
                        MyProfilRouter()
                      ],
                      index: _currentTabIndex,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
