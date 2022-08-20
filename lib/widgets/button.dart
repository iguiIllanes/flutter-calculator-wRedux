import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color primary;
  final Color onPrimary;
  const CalcButton(
      {Key? key,
      required this.text,
      this.primary = const Color(0xFF424242),
      this.onPrimary = const Color(0xFFFFFFFF)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 1000.0,
      child: (ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
          fixedSize: Size(80.0, 80.0),
          primary: primary,
          onPrimary: onPrimary,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 35.0,
          ),
        ),
      )),
    );
  }
}
