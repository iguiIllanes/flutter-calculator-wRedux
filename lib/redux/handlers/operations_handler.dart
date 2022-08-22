import '../reducer.dart';
import '../actions.dart';

AppState operationsHandler(AppState previousState, dynamic action) {
  dynamic operationChar;
  switch (action) {
    case Operations.Sum:
      operationChar = '+';
      break;
    case Operations.Substract:
      operationChar = '-';
      break;
    case Operations.Multiply:
      operationChar = '*';
      break;
    case Operations.Divide:
      operationChar = '/';
      break;
    case Operations.Equal:
      return AppState(
          currentNumber: 0, operacion: previousState.operacion, current: "");
  }
  return AppState(
      currentNumber: 0,
      operacion: "${previousState.operacion}$operationChar",
      current: "");
}