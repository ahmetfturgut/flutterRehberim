import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.teal)),
      Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
      Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
      Center(child: Icon(Icons.account_circle, size: 64.0, color: Colors.tealAccent)),
    ];
    final _kTabs = <Tab>[
      Tab(icon: Icon(Icons.cloud,), text: 'Tab1'),
      Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
      Tab(icon: Icon(Icons.forum), text: 'Tab3'),
      Tab(icon: Icon(Icons.account_circle), text: 'Tab4'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Appbar Başlık'),
          backgroundColor: Colors.teal,

          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}