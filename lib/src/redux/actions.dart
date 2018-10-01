import 'package:citiesapp/src/models/model.dart';

class AddCityAction {
  static int _id = -1;
  final String name;
  final String country;

  AddCityAction({this.name, this.country}) {
    _id++;
  }

  int get id => _id;
}

class RemoveCityAction {
  final City city;
  RemoveCityAction(this.city);
}

class RemoveCitiesAction {
}

class AddLocationAction {
  static int _id = -1;
  final int cityId;
  final String name;
  final String description;

  AddLocationAction({this.name, this.description, this.cityId}) {
    _id++;
  }

  int get id => _id;
}