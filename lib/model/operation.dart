class Operation {
  final int? id;
  final String operation;
  final String result;

  Operation({this.id, required this.operation, required this.result});

  factory Operation.fromMap(Map<String, dynamic> json) => Operation(
      id: json['id'], operation: json['operation'], result: json['result']);

  Map<String, dynamic> toMap() =>
      {'id': id, 'operation': operation, 'result': result};
}
