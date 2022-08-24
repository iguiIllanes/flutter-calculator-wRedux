import 'package:calculadora/db/helper.dart';
import 'package:calculadora/model/operation.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.of(context).pop(), icon: const Icon(Icons.arrow_back)),
        title: const Text("Historial"),
      ),
      body: Center(
        child: FutureBuilder<List<Operation>>(
          future: DatabaseHelper.instance.getHistory(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Operation>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text("Cargando..."));
            }
            return snapshot.data!.isEmpty
                ? const Center(
                    child: Text("No existen operaciones anteriores."),
                  )
                : ListView(
                    children: snapshot.data!.map((operation) {
                      return Center(
                        child: ListTile(
                          title: Text(operation.operation),
                          subtitle: Text("=${operation.result}"),
                        ),
                      );
                    }).toList(),
                  );
          },
        ),
      ),
    );
  }
}
