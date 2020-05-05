import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonsExample extends StatelessWidget {
  const ButtonsExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _showToast = () => Fluttertoast.showToast(
          msg: 'Button tapped',
          toastLength: Toast.LENGTH_SHORT,
        );

    final _showSnack = () => Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Button tapped'),
            duration: Duration(milliseconds: 500),
          ),
        );
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
                '  Her yerde gördüğümüz arka planında bir resim ve içerisinde bir yazı olan butonumuz işte bu. '
                'Raised Button en sık kullandığımız buton türüdür..'),
            SizedBox(
              height: 15,
            ),
            Text(
                ' Color : Butonumuzun rengidir. Eğer burada bir değer girmezsek butonumuz pasif olarak ekrana gelecektir.'),
            SizedBox(
              height: 15,
            ),
            Text(
                ' HighlightColor : Butonumuzun tıklandıktan sonra elimiz butona basılıyken aldığı renktir.'),
            SizedBox(
              height: 15,
            ),
            Text(
                ' Child : Butonumuzun içine alacağı widgetler burada girilir. Örnek vermek gerekirse resimde butonun içerisine sadece merhaba dünya yazdığımız için child olarak bir text widget verdik.'),
            SizedBox(
              height: 15,
            ),
            Text(
                ' Padding : Buton içerisine eklediğimiz widget ile butonun arasındaki mesafedir..'),
            SizedBox(
              height: 15,
            ),
            Text(
                ' OnPressed : Butonumuza tıklandıktan sonra nelerin olacağını buraya gireriz.'),
            SizedBox(
              height: 15,
            ),
            Text(' TextColor : Buton içerisindeki yazıların alacağı renktir.'),
            SizedBox(
              height: 15,
            ),
            Text(' Elevation : Butonumuzun etrafındaki gölge miktarıdır.'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text('RaisedButton'),
                  onPressed: _showSnack,
                ),
                RaisedButton(
                  child: Text('disabled-RaisedButton'),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
        Divider(color:Colors.grey, thickness: 5,),
        Column(
          children: <Widget>[
            Text(
                'Flat Button ise raised buttona göre bir arka plan rengi verilmediğinde dahi çalışabilen buton türüdür.'
                ' Hatırlayacağınız üzere raised buttonda arka plana bir renk vermediğimiz zaman button otomatik olarak disabled geliyordu. Flat buttonda ise renk verilirse arka plana uygulanır ama verilmezse buton yine çalışır.'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text('FlatButton'),
                  onPressed: _showToast,
                ),
                FlatButton(
                  child: Text('disabled-FlatButton'),
                  onPressed: null,
                ),
              ],
            ),
          ],
        ),
              Divider(color:Colors.grey, thickness: 5,),
        Column(
          children: <Widget>[
            Text(
                'Floating Action Button’lar yuvarlak olarak oluşturulan butonlardır. Genellikle içerisine bir ikon olarak kullanılırlar. Ayrıca sık olarak scaffold içerisinde kullanılma özelliğine sahiptirler.'),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FloatingActionButton(
                  child: Icon(Icons.thumb_down),
                  elevation: 10,
                  backgroundColor: Colors.blue,
                  onPressed: _showToast,
                ),
              ],
            ),
            SizedBox(height: 15,),
            Text('Floating Action Button',style: TextStyle(fontWeight: FontWeight.bold),)
          ],
        ),
             Divider(color:Colors.grey, thickness: 5,),
        Column(
          children: <Widget>[
            Text('Icon Button adından da anlaşılacağı üzere ikon şeklinde olan butonlarımızdır. İnstagram’da bulunan resim beğenme butonu veya bazı uygulamalarda bulunan ses artırıp azaltma butonları örnek verilebilir.'),
            Center(
              child: IconButton(
                iconSize: 32.0,
                icon: Icon(Icons.call),
                tooltip: 'Burası Tooltip',
                onPressed: _showSnack,
              ),
            ),Text('Icon Button’un şimdiye kadar gördüğümüz butonlara göre ayrılan özellikleri ise icon ve tooltip özelliği. Burada içerisine bir widget almak yerine direk icon aluyor.'
            ' Tooltip ise butona tıkladığımızda alt kısımda çıkan küçük bir talimat yazısı olarak düşünebiliriz.')
          ],
        ),
      ],
    );
  }
}
