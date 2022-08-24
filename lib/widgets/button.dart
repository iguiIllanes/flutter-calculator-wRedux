import 'package:calculadora/redux/actions.dart';
import 'package:calculadora/redux/reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color primary;
  final Color onPrimary;
  final bool smallText;
  final dynamic action;
  const CalcButton({
    Key? key,
    required this.text,
    this.primary = const Color(0xFF424242),
    this.onPrimary = const Color(0xFFFFFFFF),
    this.smallText = false,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 1000.0,
      child: StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          if (action == Operations.Equal && store.state.result != '=') {
            // addToHistory(store);
          }
          return () => store.dispatch(action);
        },
        builder: (context, callback) => ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            fixedSize: const Size(70.0, 70.0),
            primary: primary,
            onPrimary: onPrimary,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: smallText ? 20.0 : 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
