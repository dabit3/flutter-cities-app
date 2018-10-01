import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:citiesapp/src/models/model.dart';
import 'package:citiesapp/src/redux/actions.dart';

final _viewCityScaffoldKey = new GlobalKey<ScaffoldState>();

class ViewCity extends StatefulWidget{
  final City city;
  ViewCity(this.city);

   @override ViewCityWithState createState() => ViewCityWithState(city: city);
}

class ViewCityWithState extends State {
  ViewCityWithState({Key key, @required this.city});

  final City city;
  var modalOpened = false;

  void _showBottomSheet() {
    if (modalOpened) return;
    setState((){
      modalOpened = true;
    });
    _viewCityScaffoldKey.currentState
      .showBottomSheet((context) {
        return AddLocation(city);
      })
      .closed
      .whenComplete(() {
        setState((){
          modalOpened = false;
        });
      });
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      key: _viewCityScaffoldKey,
      appBar: AppBar(
        title: Text(city.name),
      ),
      body: StoreConnector<AppState, City>(
        converter: (store) => store.state.cities[city.id],
        builder: (context, city) => ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: city.locations.map((i) => ListTile(
            title: Text(i.name),
            subtitle: Text(i.description),
          )).toList()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showBottomSheet();
        },
        child: Icon(Icons.add),
      )
    );
  }
}

class AddLocation extends StatefulWidget{
  final City city;
  AddLocation(this.city);

  @override AddLocationWithState createState() => AddLocationWithState(city);
}

class AddLocationWithState extends State {
  final City city;
  final nameController = TextEditingController();
  final descriptioncontroller = TextEditingController();

  AddLocationWithState(this.city);

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptioncontroller.dispose();
  }

  @override
  build(BuildContext context) {
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
                hintText: "Enter the location name",
                labelText: "Location Name",
                labelStyle: TextStyle(
                  color: new Color.fromRGBO(255,255,255, .5)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            TextField(
              controller: descriptioncontroller,
              decoration: InputDecoration(
                hintText: "Enter the locaiton description",
                labelText: "Location Description",
                labelStyle: TextStyle(
                  color: new Color.fromRGBO(255,255,255, .5)
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            StoreConnector <AppState, dynamic>(
              converter: (store) => ({cityId, name, description}) {
                store.dispatch(AddLocationAction(cityId: cityId, name: name, description: description));
              },
              builder: (context, add) =>  RaisedButton(
              child: Text("Add"),
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    print("No Text for name");
                  }
                  add(cityId: city.id, name: nameController.text, description: descriptioncontroller.text);
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
