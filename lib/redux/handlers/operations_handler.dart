import '../../db/helper.dart';
import '../../model/operation.dart';
import '../reducer.dart';
import '../actions.dart';

AppState operationsHandler(AppState previousState, dynamic action) {
  List<dynamic> newOperations = previousState.operations;
  dynamic operationChar;
  switch (action) {
    case Operations.Sum:
      operationChar = '+';
      break;
    case Operations.Substract:
      operationChar = '-';
      break;
    case Operations.Multiply:
      operationChar = 'x';
      break;
    case Operations.Divide:
      operationChar = '/';
      break;
    case Operations.Equal:
      // sacar resultados
      newOperations.add(previousState
          .currentNumber); // se asegura de que el ultimo numero se incluya

      String result = _operate(newOperations).toString();
      addToHistory(previousState.operacion, result);

      return AppState(
          currentNumber: 0,
          operacion: previousState.operacion,
          current: "",
          operations: [],
          result: result);
  }

  newOperations.addAll([previousState.currentNumber, operationChar]);

  return AppState(
      currentNumber: 0,
      operacion: "${previousState.operacion}$operationChar",
      current: "",
      operations: newOperations);
}

dynamic _operate(List<dynamic> operations) {
  dynamic result;
  List<String> operators = ['x', '/', '+', '-'];
  for (int j = 0; j < 4; j++) {
    for (int i = 0; i < operations.length; i++) {
      if (operators[j] == operations[i]) {
        dynamic result =
            makeOperation(operations[i - 1], operations[i], operations[i + 1]);
        operations[i] = result;
        operations.removeAt(i - 1);
        operations.removeAt(i);
      }
    }
  }
  result = operations[0];

  if (result.runtimeType == double) {
    result = double.parse(result.toString()).toStringAsFixed(4);
  }
  return result;
}

void addToHistory(String operation, String result) async {
  await DatabaseHelper.instance
      .add(Operation(operation: operation, result: result));
}

dynamic makeOperation(dynamic a, String operator, dynamic b) {
  dynamic result;
  switch (operator) {
    case "+":
      result = a + b;
      break;
    case "-":
      result = a - b;
      break;
    case "x":
      result = a * b;
      break;
    case "/":
      result = a / b;
      break;
  }
  return result;
}
