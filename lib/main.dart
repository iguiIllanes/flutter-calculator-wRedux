import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import './redux/reducer.dart';
import './widgets/main_screen.dart';

void main() {
  final store = Store<AppState>(reducers,
      initialState: const AppState(currentNumber: 0, operacion: ""));
  runApp(MainScreen(
    title: 'Calculadora',
    store: store,
  ));
}