import 'package:citiesapp/src/models/model.dart';
import 'package:citiesapp/src/redux/actions.dart';
import 'package:redux/redux.dart';

enum Actions { Increment }

List <City> addLocationReducer(List <City> state, action) {
  final City cityFromList = state.firstWhere((city) => city.id == action.cityId);
  final int index = state.indexOf(cityFromList);
  final Location locationToAdd = Location(name: action.name, description: action.description, id: action.id);

  cityFromList.locations.add(locationToAdd);

  var listCopy = <City>[]..addAll(state);
  listCopy[index] = cityFromList;

  print("${listCopy[0].locations[0].name}");
  return listCopy;
}

List <City> addCityReducer(List<City> state, action) {
  return []
      ..addAll(state)
      ..add(City.createCity(
        id: action.id,
        name: action.name,
        country: action.country,
      ));
}

List <City> removeCityReducer(List<City> state, action) {
  return List.unmodifiable(List.from(state)..remove(action.item));
}

List <City> removeCitiesReducer(List<City> state, action) {
  return List.unmodifiable([]);
}

final Reducer <List<City>> itemsReducer = combineReducers <List<City>>([
  new TypedReducer<List<City>, AddCityAction>(addCityReducer),
  new TypedReducer<List<City>, RemoveCityAction>(removeCityReducer),
  new TypedReducer<List<City>, RemoveCitiesAction>(removeCitiesReducer),
  new TypedReducer<List<City>, AddLocationAction>(addLocationReducer),
]);

AppState appStateReducer(AppState state, action) {
  return AppState(
    cities: itemsReducer(state.cities, action),
  );
}
