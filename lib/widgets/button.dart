import 'package:flutter/material.dart';

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
      child: ElevatedButton(
        onPressed: () {}, //TODO aniadir funcionabilidad
        style: ElevatedButton.styleFrom(
          foregroundColor: onPrimary,
          backgroundColor: primary,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          fixedSize: const Size(70.0, 70.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: smallText ? 20.0 : 30.0,
          ),
        ),
      ),
    );
  }
}
