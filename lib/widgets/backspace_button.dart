import 'package:calculadora/redux/actions.dart';
import 'package:calculadora/redux/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class BackspaceButton extends StatelessWidget {
  const BackspaceButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(Edit.Backspace);
        },
        builder: (context, callback) => ElevatedButton(
              onPressed: callback,
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.greenAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0))),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(125.0, 70.0))),
              child: const Icon(
                Icons.backspace_outlined,
                color: Colors.black,
                size: 30.0,
              ),
            ));
  }
}
