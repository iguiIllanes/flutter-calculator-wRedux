import 'package:flutter/material.dart';

class HistoryButton extends StatelessWidget {
  const HistoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0))),
          fixedSize: MaterialStateProperty.all<Size>(const Size(100.0, 70.0))),
      child: const Icon(
        Icons.history,
        size: 35.0,
        color: Colors.black,
      ),
    );
  }
}
