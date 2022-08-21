import 'package:calculadora/redux/actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import './widgets/display.dart';
import './widgets/button.dart';

//para redux
import './redux/reducer.dart';

// One simple action: Increment

void main() {
  // Create your store as a final variable in the main function or inside a
  // State object. This works better with Hot Reload than creating it directly
  // in the `build` function.
  final store = Store<AppState>(reducers,
      initialState: const AppState(currentNumber: 0, operacion: ""));
  runApp(FlutterReduxApp(
    title: 'Calculadora',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<AppState> store;
  final String title;

  const FlutterReduxApp({
    Key? key,
    required this.store,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The StoreProvider should wrap your MaterialApp or WidgetsApp. This will
    // ensure all routes have access to the store.
    return StoreProvider<AppState>(
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
                const Display(),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10.0,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.greenAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0))),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(125.0, 80.0))),
                      child: const Icon(
                        Icons.history,
                        size: 35.0,
                        color: Colors.black,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.greenAccent),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50.0))),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(125.0, 80.0))),
                      child: const Icon(
                        Icons.backspace_outlined,
                        color: Colors.black,
                        size: 30.0,
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    const CalcButton(
                      text: "/",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      action: Operations.Divide,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Wrap(
                  spacing: 10.0,
                  children: const [
                    CalcButton(
                      text: "7",
                      action: Add.Seven,
                    ),
                    CalcButton(
                      text: "8",
                      action: Add.Eight,
                    ),
                    CalcButton(
                      text: "9",
                      action: Add.Nine,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "x",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      action: Operations.Multiply,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Wrap(
                  spacing: 10.0,
                  children: const [
                    CalcButton(
                      text: "4",
                      action: Add.Four,
                    ),
                    CalcButton(
                      text: "5",
                      action: Add.Five,
                    ),
                    CalcButton(
                      text: "6",
                      action: Add.Six,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "-",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      action: Operations.Substract,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Wrap(
                  spacing: 10.0,
                  children: const [
                    CalcButton(text: "1", action: Add.One),
                    CalcButton(
                      text: "2",
                      action: Add.Two,
                    ),
                    CalcButton(
                      text: "3",
                      action: Add.Three,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "+",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      action: Operations.Sum,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Wrap(
                  spacing: 10.0,
                  children: const [
                    CalcButton(
                      text: ".",
                      action: Add.Dot,
                    ),
                    CalcButton(
                      text: "0",
                      action: Add.Zero,
                    ),
                    CalcButton(
                      text: "AC",
                      smallText: true,
                      primary: Colors.orangeAccent,
                      onPrimary: Colors.black,
                      action: Edit.Backspace,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "=",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      action: Operations.Equal,
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
          // floatingActionButton: StoreConnector<int, VoidCallback>(
          //   converter: (store) {
          //     // Return a `VoidCallback`, which is a fancy name for a function
          //     // with no parameters and no return value.
          //     // It only dispatches an Increment action.
          //     return () => store.dispatch(Actions.Increment);
          //   },
          //   builder: (context, callback) {
          //     return FloatingActionButton(
          //       // Attach the `callback` to the `onPressed` attribute
          //       onPressed: callback,
          //       tooltip: 'Increment',
          //       child: Icon(Icons.add),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
