import 'package:flutter/material.dart' hide Stack;
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';

import './redux/reducer.dart';
import './widgets/main_screen.dart';

void main() {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  List<dynamic> initialList = [];
  final store = Store<AppState>(reducer,
      initialState: AppState(
          currentNumber: 0,
          operacion: " ",
          current: "",
          operations: initialList));
  runApp(MainScreen(
    title: 'Calculadora',
    store: store,
  ));
}
