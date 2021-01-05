import 'package:flutter/material.dart';
import 'package:flutter_rehberim/icon.dart';

class Widgets extends StatefulWidget {
  @override
  _WidgetsState createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;
    Color color1 = Color(0xFF86F0C3);
    Color color2 = Color(0xFFFEE38F);
    Color color3 = Color(0xFFA7D9F7);
    Color color4 = Color(0xFFFCC7AA);
    Color color5 = Color(0xFF8E95FF);
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFFAFBFD)),
        child: Padding(
          padding: const EdgeInsets.only(top: 18.0, left: 10, right: 10),
          child: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: (itemWidth / itemHeight),
            controller: new ScrollController(keepScrollOffset: false),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(
                                widgetKey: "Icon",
                                color: color1,
                              )));
                },
                child: Card(
                  color: color1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Icon",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "A graphical icon widget drawn with a glyph from a font described in an IconData such as material's predefined IconDatas in Icons.",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  elevation: 5,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              WidgetPage(widgetKey: "Text", color: color2)));
                },
                child: Card(
                  color: color2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Text",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "The Text widget displays a string of text with single style.",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  elevation: 5,
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetPage(
                                widgetKey: "Switch", color: color3)));
                  },
                  child: Card(
                    color: color3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Switch",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Widget that provides on / off buttons.",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    elevation: 5,
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetPage(
                                widgetKey: "Checkbox", color: color4)));
                  },
                  child: Card(
                    color: color4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Checkbox",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Rectangular checkbox widget.",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    elevation: 5,
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetPage(
                                widgetKey: "Alert Dialog", color: color5)));
                  },
                  child: Card(
                    color: color5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Alert Dialog",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Provides a warning window such as 'Cancel' .. 'Continue'.",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    elevation: 5,
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetPage(
                                widgetKey: "Indicator", color: color1)));
                  },
                  child: Card(
                    color: color1,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text("Indicator",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    )),
                    elevation: 5,
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetPage(
                                widgetKey: "Slider", color: color2)));
                  },
                  child: Card(
                    color: color2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Slider",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Widget that creates a scrollable slider.",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    elevation: 5,
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WidgetPage(widgetKey: "Radio", color: color3)));
                  },
                  child: Card(
                    color: color3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Radio",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Round option widget.",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    elevation: 5,
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetPage(
                                widgetKey: "TextField", color: color4)));
                  },
                  child: Card(
                    color: color4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("TextField",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "A material design text field.",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    elevation: 5,
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetPage(
                                widgetKey: "TextFormField", color: color5)));
                  },
                  child: Card(
                    color: color5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("TextFormField",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "This is a convenience widget that wraps a TextField widget in a FormField.",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    elevation: 5,
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WidgetPage(widgetKey: "Image", color: color1)));
                  },
                  child: Card(
                    color: color1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Image",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                            "Fetches an image from an AssetBundle, having determined the exact image to use based on the context.",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    elevation: 5,
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetPage(
                                widgetKey: "Card,Inkwell", color: color2)));
                  },
                  child: Card(
                    color: color2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Card, Inkwell",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Card: A panel with slightly rounded corners and an elevation shadow.\n"
                            "Inkwell: A rectangular area of a Material that responds to touch.",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    elevation: 5,
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WidgetPage(
                                widgetKey: "Buttons", color: color3)));
                  },
                  child: Card(
                    color: color3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Buttons",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "RaisedButton,FlatButton, OutlineButton, IconButton&Tooltips",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                    elevation: 5,
                  )),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WidgetPage(
                              widgetKey: "DropdownButton,MenuButton",
                              color: color4)));
                },
                child: Container(
                  width: 150,
                  height: 150,
                  child: Card(
                    color: color4,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("DropdownButton",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("MenuButton",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    )),
                    elevation: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
