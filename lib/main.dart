import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import './widgets/display.dart';
import './widgets/button.dart';

// One simple action: Increment
enum Actions { Increment }

// The reducer, which takes the previous count and increments it in response
// to an Increment action.
int counterReducer(int state, dynamic action) {
  if (action == Actions.Increment) {
    return state + 1;
  }

  return state;
}

void main() {
  // Create your store as a final variable in the main function or inside a
  // State object. This works better with Hot Reload than creating it directly
  // in the `build` function.
  final store = Store<int>(counterReducer, initialState: 0);

  runApp(FlutterReduxApp(
    title: 'Calculadora',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<int> store;
  final String title;

  FlutterReduxApp({
    Key? key,
    required this.store,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
    // ensure all routes have access to the store.
    return StoreProvider<int>(
      // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      // Widgets will find and use this value as the `Store`.
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: title,
        home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Display(),
                Wrap(
                  spacing: 10.0,
                  children: const [
                    CalcButton(
                      text: "7",
                    ),
                    CalcButton(
                      text: "8",
                    ),
                    CalcButton(
                      text: "9",
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "+",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                    ),
                  ],
                ),
                Wrap(
                  spacing: 10.0,
                  children: const [
                    CalcButton(
                      text: "4",
                    ),
                    CalcButton(
                      text: "5",
                    ),
                    CalcButton(
                      text: "6",
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "+",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                    ),
                  ],
                ),
                Wrap(
                  spacing: 10.0,
                  children: const [
                    CalcButton(
                      text: "1",
                    ),
                    CalcButton(
                      text: "2",
                    ),
                    CalcButton(
                      text: "3",
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "+",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                    ),
                  ],
                ),
                Wrap(
                  spacing: 10.0,
                  children: const [
                    CalcButton(
                      text: ".",
                    ),
                    CalcButton(
                      text: "0",
                    ),
                    CalcButton(
                      text: "AC",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "=",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Connect the Store to a FloatingActionButton. In this case, we'll
          // use the Store to build a callback that will dispatch an Increment
          // Action.
          //
          // Then, we'll pass this callback to the button's `onPressed` handler.
          floatingActionButton: StoreConnector<int, VoidCallback>(
            converter: (store) {
              // Return a `VoidCallback`, which is a fancy name for a function
              // with no parameters and no return value.
              // It only dispatches an Increment action.
              return () => store.dispatch(Actions.Increment);
            },
            builder: (context, callback) {
              return FloatingActionButton(
                // Attach the `callback` to the `onPressed` attribute
                onPressed: callback,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              );
            },
          ),
        ),
      ),
    );
  }
}
