import 'dart:developer';

import 'package:flutter/material.dart' hide Stack;
import 'package:redux/redux.dart';
import 'package:stack/stack.dart';

import './redux/reducer.dart';
import './widgets/main_screen.dart';

void main() {
  final store = Store<AppState>(reducer,
      initialState:
          const AppState(currentNumber: 0, operacion: " ", current: ""));
  runApp(MainScreen(
    title: 'Calculadora',
    store: store,
  ));
}
