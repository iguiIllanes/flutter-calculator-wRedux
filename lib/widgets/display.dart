import 'package:calculadora/redux/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

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
              StoreConnector<AppState, String>(
                converter: (store) => store.state.current,
                builder: (context, st) => Text(
                  st,
                  style: const TextStyle(fontSize: 50.0),
                ),
              ),
              StoreConnector<AppState, String>(
                converter: (store) => store.state.operacion,
                builder: (context, st) => Text(
                  st,
                  style: const TextStyle(fontSize: 25.0, color: Colors.white60),
                ),
              ),
              StoreConnector<AppState, String>(
                  converter: (store) => store.state.result,
                  builder: (context, result) => Text(
                        "= $result",
                        style: const TextStyle(
                            fontSize: 40.0, color: Colors.greenAccent),
                      )),
            ],
          ),
        ));
  }
}
