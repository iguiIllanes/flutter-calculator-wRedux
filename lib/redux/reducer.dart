import 'dart:collection';

import 'package:flutter/material.dart';

import './actions.dart';
import 'handlers/add_handler.dart';
import 'handlers/edit_handler.dart';
import 'handlers/operations_handler.dart';

@immutable
class AppState {
  final dynamic currentNumber;
  final String operacion;
  final String current;
  final String result;
  final bool isFloatingPointActive;
  final List<dynamic> operations;

  const AppState(
      {required this.currentNumber,
      this.operacion = "",
      this.current = "a",
      this.isFloatingPointActive = false,
      this.result = "",
      required this.operations});
}

AppState reducer(AppState previousState, dynamic action) {
  switch (action.runtimeType) {
    case Add:
      return addHandler(previousState, action);
    case Operations:
      return operationsHandler(previousState, action);
    case Edit:
      return editHandler(previousState, action);
  }
  return previousState;
}
