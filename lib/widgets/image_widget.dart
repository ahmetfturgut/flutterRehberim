import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ImageExample extends StatelessWidget {
  const ImageExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ListTile(title: Text('Image from asset:')),
        Card(
          child: Image.asset('assets/images/flutter-sdk.png'),
        ),
        Divider(),
        ListTile(title: Text('Image from url:')),
        Card(
          // FadeInImage is better than Image.network because it can show a
          // placeholder when image is loading. C.f.
          // https://flutter.io/docs/cookbook/images/fading-in-images
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image:
            'https://images.freeimages.com/images/large-previews/4ad/coloured-pencils-1427682.jpg',
          ),
        ),
        Divider(),
        ListTile(title: Text('Cached network image:')),
        CachedNetworkImage(
          imageUrl: 'https://picsum.photos/id/7/250/250',
          placeholder: (context, url) =>
              Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Divider(),
        ListTile(title: Text('GIF from asset:')),
        Image.asset(
          'assets/images/flutter.gif',
          scale: 1.0,
          height: 300,
        ),

      ],
    );
  }
}