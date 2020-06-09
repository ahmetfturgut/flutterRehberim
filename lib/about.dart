import 'package:flutter/material.dart';
import 'package:flutter_rehberim/utils.dart';

import 'package:url_launcher/url_launcher.dart' as url_launcher;

class MyAbout{

 static final header = ListTile(
    leading: kAppIcon,
    title: Text(APP_NAME),
    subtitle: Text(APP_VERSION),
  );


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



}