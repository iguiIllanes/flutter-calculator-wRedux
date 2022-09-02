import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 250.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "", //TODO Appstate.current
                style: const TextStyle(fontSize: 50.0),
              ),
              Text(
                "", //TODO AppState.operacion
                style: const TextStyle(fontSize: 25.0, color: Colors.white60),
              ),
              Text(
                "= ", //TODO AppState.result
                style:
                    const TextStyle(fontSize: 40.0, color: Colors.greenAccent),
              )
            ],
          ),
        ));
  }
}
