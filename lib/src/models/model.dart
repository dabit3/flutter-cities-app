import 'package:flutter/foundation.dart';

class City {
  final int id;
  final String name;
  final String country;
  final List <Location> locations;

  City({
    this.id,
    this.name,
    this.country,
    this.locations,
  });

  City.createCity({id, name, country, locations})
    : id = id,
      name = name,
      country = country,
      locations = <Location>[];
}

class Location {
  final int id;
  final String name;
  final String description;

  Location({
    this.id,
    this.name,
    this.description,
  });
}

class AppState {
  final List<City> cities;

  AppState({
    @required this.cities,
  });

  static City firstCity = City(
    name: "New York",
    country: "USA",
    id: 0,
    locations: <Location>[]
  );

  AppState.initialState()
    : cities = List.unmodifiable(<City>[]);
}