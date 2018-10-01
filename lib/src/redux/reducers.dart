import 'package:citiesapp/src/models/model.dart';
import 'package:citiesapp/src/redux/actions.dart';
import 'package:redux/redux.dart';

enum Actions { Increment }

List <City> addCityReducer(List<City> state, action) {
  return []
      ..addAll(state)
      ..add(City(
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
]);

AppState appStateReducer(AppState state, action) {
  return AppState(
    cities: itemsReducer(state.cities, action),
  );
}
