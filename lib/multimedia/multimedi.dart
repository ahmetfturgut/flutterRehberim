import 'package:flutter/material.dart';
import 'package:flutter_rehberim/icon.dart';

class Multimedia extends StatefulWidget {
  @override
  _MultimediaState createState() => _MultimediaState();
}

class _MultimediaState extends State<Multimedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Multimedia"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/35.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
          child: GridView.count(
            crossAxisCount: 3,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "Image Picker")));
                },
                child: Card(
                  child: Center(child: Text("Image Picker")),
                  elevation: 5,
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) =>
              //                 WidgetPage(widgetKey: "ExtendedImage")));
              //   },
              //   child: Card(
              //     child: Center(child: Text("Extended Image")),
              //     elevation: 5,
              //   ),
              // ),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) =>
              //                 WidgetPage(widgetKey: "VideoPlayer")));
              //   },
              //   child: Card(
              //     child: Center(child: Text("Video Player")),
              //     elevation: 5,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
