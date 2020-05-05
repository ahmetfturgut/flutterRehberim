import 'package:flutter/material.dart';

class ListTilE extends StatelessWidget { 

  @override
  Widget build(BuildContext context) {
    var listTiles = <Widget>[
        ListTile(
                leading: Icon(Icons.flight_land), // başlıktan önce gösterilecek icon aavatar
                title:  Text ("Başlık") ,// Başlık
                subtitle: Text ("Alt Başlık"), //Başlığın altında görüntülenen ek içerik
                trailing:Icon(Icons.add), //Başlıktan sonra görüntülenecek icon
                isThreeLine: false,// üç satır metin göstermesi istenip istenmediği
                contentPadding: EdgeInsets.all(8.0), // iç ittirme boşluk değeri bilgiğimiz padding
                onTap: () { }, //kullanıcı dokunduğunda atadığımız bir fonksiyon kolayca işlem yapaniliriz
                onLongPress: () { }, ///kullanıcı uzun dokunduğunda tadığımız bir fonksiyon kolayca işlem yapaniliriz
                selected: false //true olduğunda, simgeler ve metinler aynı renkte oluşturulur.
              ),
      Divider(),
      ListTile(
        leading: Icon(Icons.face),
        title: Text('Tile 1: with leading/trailing widgets'),
        trailing: Icon(Icons.tag_faces),
      ),
      Divider(),
      ListTile(
        title: Text('Tile 2 title'),
        subtitle: Text('subtitle of tile 2'),
      ),
      Divider(),
      ListTile(
        title: Text('Tile 3: 3 lines'),
        isThreeLine: true,
        subtitle: Text('subtitle of tile 3'),
      ),
      Divider(),
      ListTile(
        title: Text('Tile 4: dense'),
        dense: true,
      ),
    ];

    return ListView(children: listTiles);
  }
}