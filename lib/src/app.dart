import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'image_model.dart';
import 'package:citiesapp/src/widgets/image_list.dart';

var url = 'http://jsonplaceholder.typicode.com/photos/';

class App extends StatefulWidget {
  createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 10;
  List <ImageModel> imageList = [];

  void fetchImage() async {
    counter++;
    final response = await get('${url}/${counter}');
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      imageList.add(imageModel);
    });
  }

  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(imageList),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text("TRAVLR"),
          backgroundColor: Colors.black,
        ),
      )
    );
  }
}