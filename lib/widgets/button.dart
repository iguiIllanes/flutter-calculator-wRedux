import 'package:calculadora/redux/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color primary;
  final Color onPrimary;
  final bool smallText;
  final dynamic action;
  // final void Function(Store<AppState> store)? converter;
  const CalcButton({
    Key? key,
    required this.text,
    this.primary = const Color(0xFF424242),
    this.onPrimary = const Color(0xFFFFFFFF),
    this.smallText = false,
    this.action,
  })
  // this.converter})
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 1000.0,
      child: StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(action);
        }, //aqui
        builder: (context, callback) => ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            fixedSize: const Size(80.0, 80.0),
            primary: primary,
            onPrimary: onPrimary,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: smallText ? 25.0 : 35.0,
            ),
          ),
        ),
      ),
    );
  }
}
