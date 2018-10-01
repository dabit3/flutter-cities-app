import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:citiesapp/src/models/model.dart';
import 'package:citiesapp/src/redux/reducers.dart';
import 'package:citiesapp/src/add_city.dart';
import 'package:citiesapp/src/view_city.dart';

final _scaffoldKey = new GlobalKey<ScaffoldState>();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
    appStateReducer,
    initialState: AppState.initialState()
  );
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: "TRAVLR",
        home: IntermedaiteWithState(),
      )
    );
  }
}

class IntermedaiteWithState extends StatefulWidget {
  @override Intermediate createState() => Intermediate();
}

class Intermediate extends State {
  var modalOpened = false;

  void _showBottomSheet() {
    if (modalOpened) return;
    setState((){
      modalOpened = true;
    });
    _scaffoldKey.currentState
      .showBottomSheet((context) {
        return AddCityWithState();
      })
      .closed
      .whenComplete(() {
        setState((){
          modalOpened = false;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverlayItem(),
      floatingActionButton: FloatingActionButton(
        child: getIcon(modalOpened),
        onPressed: _showBottomSheet,
      ),
    );
  }
}

getIcon(bool modalState) {
  if (modalState) return Icon(Icons.accessibility); 
  else return Icon(Icons.add);
}

class OverlayItem extends StatefulWidget {
  @override OverlayItemState createState() => OverlayItemState();
}

class OverlayItemState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("TRAVLR"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // ListInput(),
            ViewList(),
          ]
        )
      )
    );
  }
}


class ViewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<City>>(
      converter: (store) => store.state.cities,
      builder: (context, items) => ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: items.map((i) => ListTile(
          title: Text(i.name),
          subtitle: Text(i.country),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ViewCity(i)),
            );
          },
        )).toList()),
    );
  }
}