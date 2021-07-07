import 'package:flutter_redux_presentation/redux/actions.dart';
import 'package:flutter_redux_presentation/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_types/redux_types.dart';

/// ========================== 通常の Reducer 方式 ==============================

AppState appReducer(AppState state, dynamic action) {
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

/// ========================== 型付け Reducer 方式 ==============================
///
/// A function which is executed when type matched of [ReducerOf].
///
/// Lets [ReducerOf] act as a function.
///  @override
///  S call(S state, dynamic action) {
///    if (action is A) {
///      return callback(state, action);
///    }
///      return state;
///  }

// final Reducer<AppState> appReducer = combineReducers(
//   [
//     ReducerOf<AppState, LoadAction1>(
//       callback: (state, action) {
//         print('Reducer action1');
//         return state.copyWith(output: 'Action 1');
//       },
//     ),
//     ReducerOf<AppState, LoadAction2>(
//       callback: (state, action) {
//         print('Reducer action2');
//         return state.copyWith(output: 'Action 2');
//       },
//     ),
//     ReducerOf<AppState, LoadAction3>(
//       callback: (state, action) {
//         print('Reducer action3');
//         return state.copyWith(output: 'Action 3');
//       },
//     ),
//   ],
// );
