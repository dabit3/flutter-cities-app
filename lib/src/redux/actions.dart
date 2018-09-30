import 'package:citiesapp/src/models/model.dart';

class AddCityAction {
  static int _id = 0;
  final String city;

  AddCityAction(this.city) {
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