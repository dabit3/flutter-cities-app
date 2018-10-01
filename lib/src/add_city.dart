import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:citiesapp/src/models/model.dart';
import 'package:citiesapp/src/redux/actions.dart';

class AddCityWithState extends StatefulWidget {
  @override AddCityState createState() => AddCityState(); 
}

class AddCityState extends State {
  final nameController = TextEditingController();
  final countryController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    countryController.dispose();
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
            StoreConnector <AppState, dynamic>(
              converter: (store) => ({name, country}) {
                store.dispatch(AddCityAction(name: name, country: country));
              },
              builder: (context, add) =>  RaisedButton(
              child: Text("Add"),
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    print("No Text for name");
                  }
                  add(name: nameController.text, country: countryController.text);
                  Navigator.pop(context);
                }
              )
            ),
          ]
        )
      )
    );
  }
}