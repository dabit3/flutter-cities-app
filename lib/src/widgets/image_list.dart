import 'package:flutter/material.dart';
import '../image_model.dart';

class ImageList extends StatelessWidget {
  final List <ImageModel> images;
 
  ImageList(this.images);

  Widget build(context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        return this.buildImage(images[index]);
      },
    );
  }

  buildImage(ImageModel image) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
      child: Column(
        children: <Widget>[
          Image.network(image.url),
          Container(
            child: Text(image.title),
            margin: EdgeInsets.only(top: 15.0),
          )
        ],
      ),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.0)
      )
    );
  }
}