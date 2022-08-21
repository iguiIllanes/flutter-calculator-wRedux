import 'dart:developer'; //debug only!

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import './actions.dart';

@immutable
class AppState {
  final dynamic currentNumber;
  final String operacion;

  const AppState({required this.currentNumber, required this.operacion});

  AppState copyWith({currentNumber, operacion}) {
    return AppState(
        currentNumber: currentNumber ?? this.currentNumber,
        operacion: operacion ?? this.operacion);
  }
}

AppState operationsReducer(AppState previousState, dynamic action) {
  //TODO finish this!
  switch (action) {
    case Operations.Sum:
      return previousState.copyWith(
          currentNumber: previousState.currentNumber + 1,
          operacion: previousState.operacion);
  }
  return previousState;
}

AppState addReducer(AppState previousState, dynamic action) {
  dynamic selectedNumber = 0;
  switch (action) {
    case Add.Zero:
      selectedNumber = 0;
      break;
    case Add.One:
      selectedNumber = 1;
      break;
    case Add.Two:
      selectedNumber = 2;
      break;
    case Add.Three:
      selectedNumber = 3;
      break;
    case Add.Four:
      selectedNumber = 4;
      break;
    case Add.Five:
      selectedNumber = 5;
      break;
    case Add.Six:
      selectedNumber = 6;
      break;
    case Add.Seven:
      selectedNumber = 7;
      break;
    case Add.Eight:
      selectedNumber = 8;
      break;
    case Add.Nine:
      selectedNumber = 9;
      break;
    case Add.Dot:
      return AppState(
          currentNumber: previousState.currentNumber + 0.0,
          operacion: "${previousState.currentNumber}+.");
    default:
      return previousState;
  }

  log("${(previousState.currentNumber * 10) + selectedNumber}");

  return AppState(
      currentNumber: (previousState.currentNumber * 10) + selectedNumber,
      operacion: "${previousState.operacion}$selectedNumber");
}

AppState editReducer(AppState previousState, dynamic action) {
  switch (action) {
    case Edit.AC:
      return const AppState(currentNumber: 0, operacion: "");
    case Edit.Backspace:
      String previousOperacion = previousState.operacion;
      log("${num.parse(previousOperacion.substring(0, previousOperacion.length - 1))}");
      return AppState(
          currentNumber: num.parse(previousOperacion.substring(0, previousOperacion.length - 1)),
          operacion: previousOperacion
              .substring(0, previousOperacion.length - 1));
  }
  return previousState;
}

final reducers = combineReducers([operationsReducer, addReducer, editReducer]);
