import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';

class Backdrop extends StatelessWidget {
  const Backdrop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      title: Text('Backdrop demo'),
      iconPosition: BackdropIconPosition.action,
      // Height of front layer when backlayer is shown.
      headerHeight: 120.0,
      frontLayer: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
                '(Ön Yüz) \n Arka yüzü görmek için sağ üst düğmeye tıklayın.\n\n'
                    "Bu Flutturın kendi widget ı değildir"
                    " 'backdrop' package.",style: TextStyle(fontSize: 18),),
          )),
      backLayer: Center(child: Text('(Arka Yüz)',style: TextStyle(fontSize: 22,color: Colors.white),)),
    );
  }
}