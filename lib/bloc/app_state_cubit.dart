import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:math_expressions/math_expressions.dart';

import '../db/helper.dart';
import '../model/operation.dart';
import 'app_state.dart';

class AppStateCubit extends Cubit<AppState> {
  AppStateCubit() : super(AppState(currentNumber: 0));

  void addNumber(dynamic number) {
    if (number == ".") {
      if (!state.isFloatingPointActive) {
        emit(AppState(
            currentNumber: state.currentNumber.toDouble(),
            operacion: "${state.operacion}.",
            current: "${state.currentNumber}.",
            isFloatingPointActive: true));
      }
      return;
    }

    emit(AppState(
        currentNumber: state.isFloatingPointActive
            ? num.parse("${state.current}$number")
            : (state.currentNumber * 10) + num.parse(number),
        operacion:
            state.result.isNotEmpty ? "$number" : "${state.operacion}$number",
        current: "${state.current}$number",
        isFloatingPointActive: state.isFloatingPointActive));
  }

  void addOperation(String operation) {
    if (operation == "=") {
      const operations = "x/-+";
      // log(state.operacion[state.operacion.length - 1]);
      if (state.operacion.isNotEmpty ||
          !operations.contains(state.operacion[state.operacion.length - 1])) {
        // comprueba que no sea una operacion vacia o invalida
        String result = _operate(state.operacion);
        _addToHistory(state.operacion, result);

        emit(AppState(
            currentNumber: 0,
            operacion: state.operacion,
            current: "",
            result: result));
      }
      return;
    }
    emit(AppState(
        currentNumber: 0,
        operacion: "${state.operacion}$operation",
        current: ""));
  }

  void backspacePressed() {
    String previousOperacion = state.current;
    if (previousOperacion.length <= 1) {
      emit(AppState(
          currentNumber: 0,
          operacion: state.operacion.substring(0, state.operacion.length - 1),
          current: ""));
      return;
    }
    emit(AppState(
        currentNumber: num.parse(
            previousOperacion.substring(0, previousOperacion.length - 1)),
        operacion: state.operacion.substring(0, state.operacion.length - 1),
        current: previousOperacion.substring(0, previousOperacion.length - 1)));
  }

  void acPressed() {
    emit(AppState(currentNumber: 0, operacion: "", current: ""));
  }

  String _operate(String operacion) {
    String finaluserinput = operacion;
    finaluserinput = operacion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    return eval.toString();
  }

  void _addToHistory(String operation, String result) async {
    await DatabaseHelper.instance
        .add(Operation(operation: operation, result: result));
  }
}
