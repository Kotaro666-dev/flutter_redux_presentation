import 'package:flutter_redux_presentation/redux/app_state.dart';
import 'package:redux/redux.dart';

const middlewares = [middleware1, middleware2, middleware3];

void middleware1(Store<AppState> store, dynamic action, NextDispatcher next) {
  print('Middleware 1  A');
  next(action);
  print('Middleware 1  B');
}

void middleware2(Store<AppState> store, dynamic action, NextDispatcher next) {
  print('Middleware 2  A');
  next(action);
  print('Middleware 2  B');
}

void middleware3(Store<AppState> store, dynamic action, NextDispatcher next) {
  print('Middleware 3  A');
  next(action);
  print('Middleware 3  B');
}
