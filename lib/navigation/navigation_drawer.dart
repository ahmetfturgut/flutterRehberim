import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('Ahmet Faruk Turgut'),
      accountEmail: Text('ahmetfturgut@gmail.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
        backgroundColor: Colors.white,
      ),
      otherAccountsPictures: <Widget>[
        CircleAvatar(
          child: Text('A',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.teal,
        ),
        CircleAvatar(
          child: Text('B',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.red,
        )
      ],
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: Text('1.Sayfa'),
          onTap: () => Navigator.of(context).push(_NewPage(1)),
        ),
        ListTile(
          title: Text('2. Sayfa'),
          onTap: () => Navigator.of(context).push(_NewPage(2)),
        ),
        ListTile(
          title: Text('Diğre sayfalar'),
          onTap: () {},
        ),
      ],
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text('Drawer Örnek'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Drawer'ı görmek için sol üst düğmeye basın veya ekranın solundan sağa doğru sürükleyin",style: TextStyle(fontSize: 22),),
          ),
        ),
        drawer: Drawer(
          child: drawerItems,
        ));
  }
}

// <Null> means this route returns nothing.
class _NewPage extends MaterialPageRoute<Null> {
  _NewPage(int id)
      : super(builder: (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sayfa $id'),
        elevation: 1.0,
      ),
      body: Center(
        child: Text('Sayfa $id'),
      ),
    );
  });
}