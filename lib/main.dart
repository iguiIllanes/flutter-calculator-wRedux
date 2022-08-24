
import 'package:flutter/material.dart' hide Stack;
import 'package:redux/redux.dart';

import './redux/reducer.dart';
import './widgets/main_screen.dart';

void main() {
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
