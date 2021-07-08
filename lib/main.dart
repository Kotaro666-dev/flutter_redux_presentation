import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_presentation/redux/actions.dart';
import 'package:flutter_redux_presentation/redux/app_state.dart';
import 'package:flutter_redux_presentation/redux/middleware.dart';
import 'package:flutter_redux_presentation/redux/reducers.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _store = new Store<AppState>(
    appReducer,
    initialState: new AppState.initialize(),
    middleware: appVoidMiddleware,
    // middleware: appTypedMiddleware,
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        title: 'Redux Demonstration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(store: _store),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({
    this.store,
  });
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux Demonstration'),
      ),
      body: StoreConnector<AppState, String>(
        converter: (store) => store.state.output,
        builder: (context, output) => Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      store.dispatch(LoadAction1());
                    },
                    child: Text('Action 1'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      store.dispatch(LoadAction2());
                    },
                    child: Text('Action 2'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      store.dispatch(LoadAction3());
                    },
                    child: Text('Action 3'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '$output',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
