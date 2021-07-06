import 'package:flutter_redux_presentation/redux/actions.dart';
import 'package:flutter_redux_presentation/redux/app_state.dart';

enum Actions { action1, action2, action3 }

AppState appReducer(AppState state, action) {
  if (action is LoadAction1) {
    print('Reducer action1');
    return state.copyWith(output: 'Action 1');
  } else if (action is LoadAction2) {
    print('Reducer action2');
    return state.copyWith(output: 'Action 2');
  } else if (action is LoadAction3) {
    print('Reducer action3');
    return state.copyWith(output: 'Action 3');
  }
  return state;
}
