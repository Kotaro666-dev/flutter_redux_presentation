import 'package:flutter_redux_presentation/redux/app_state.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> appVoidMiddleware = [
  middleware1,
  middleware2,
  middleware3
];

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

/// ========================== 型付けミドルウェア方式 ==============================

/// A convenience type for binding a piece of Middleware to an Action of a specific type.
/// Allows for Type Safe Middleware and reduces boilerplate.
/// Create a Middleware that is only executed when the dispatched action matches the Action type.

/// void call(Store<State> store, dynamic action, NextDispatcher next) {
///    if (action is Action) {
///      middleware(store, action, next);
///    } else {
///      next(action);
///    }
///  }

// List<Middleware<AppState>> appTypedMiddleware = [
//   TypedMiddleware<AppState, LoadAction1>(loadAction1Middleware),
//   TypedMiddleware<AppState, LoadAction2>(loadAction2Middleware),
//   TypedMiddleware<AppState, LoadAction3>(loadAction3Middleware),
// ];
//
// void loadAction1Middleware(
//     Store<AppState> store, LoadAction1 action, NextDispatcher next) {
//   print('Middleware 1  A');
//   next(action);
//   print('Middleware 1  B');
// }
//
// void loadAction2Middleware(
//     Store<AppState> store, LoadAction2 action, NextDispatcher next) {
//   print('Middleware 2  A');
//   next(action);
//   print('Middleware 2  B');
// }
//
// void loadAction3Middleware(
//     Store<AppState> store, LoadAction3 action, NextDispatcher next) {
//   print('Middleware 3  A');
//   next(action);
//   print('Middleware 3  B');
// }
