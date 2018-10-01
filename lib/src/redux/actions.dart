import 'package:citiesapp/src/models/model.dart';

class AddCityAction {
  static int _id = 0;
  final String name;
  final String country;

  AddCityAction({this.name, this.country}) {
    print(this.name);
    print(this.country);
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