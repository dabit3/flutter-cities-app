import 'package:flutter/material.dart';

class AddCityWithState extends StatefulWidget {
  @override AddCityState createState() => AddCityState(); 
}

class AddCityState extends State {
  final nameController = TextEditingController();
  final countryController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    nameController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: new BoxDecoration(
        color: Colors.black,
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter the city name",
                labelText: "City Name",
                labelStyle: TextStyle(
                  color: new Color.fromRGBO(255,255,255, .5)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            TextField(
              controller: countryController,
              decoration: InputDecoration(
                hintText: "Enter the country name",
                labelText: "Country Name",
                labelStyle: TextStyle(
                  color: new Color.fromRGBO(255,255,255, .5)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            RaisedButton(
              child: Text("Add"),
              onPressed: () {
                if (nameController.text.isEmpty) {
                  print("No Text for name");
                }
                print("Second text field: ${nameController.text}");
                print("Second text field: ${countryController.text}");
              }
            )
          ]
        )
      )
    );
  }
}