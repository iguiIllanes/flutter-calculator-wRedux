class AppState {
  // propiedades
  final dynamic currentNumber;
  final String operacion;
  final String current;
  final String result;
  final bool isFloatingPointActive;
  final List<dynamic> operations;

  AppState(
      {required this.currentNumber,
      this.operacion = "",
      this.current = "",
      this.isFloatingPointActive = false,
      this.result = "",
      required this.operations});
}
