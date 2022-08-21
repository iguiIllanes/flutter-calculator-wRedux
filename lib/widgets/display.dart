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
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              StoreConnector<AppState, String>(
                converter: (store) => store.state.operacion,
                builder: (context, st) => Text(
                  st,
                  style: const TextStyle(fontSize: 50.0),
                ),
              ),
              // Text(
              //   "=",
              //   style: TextStyle(fontSize: 40.0, color: Colors.greenAccent),
              // )
            ],
          ),
        ));
  }
}
