import 'package:calculadora/bloc/actions.dart';
import 'package:calculadora/widgets/backspace_button.dart';
import 'package:calculadora/widgets/history_button.dart';
import 'package:flutter/material.dart';

import '../widgets/display.dart';
import '../widgets/button.dart';

class MainScreen extends StatelessWidget {
  final String title;

  const MainScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Display(),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10.0,
                children: const [
                  HistoryButton(),
                  BackspaceButton(),
                  SizedBox(
                    width: 15.0,
                  ),
                  CalcButton(
                    text: "/",
                    primary: Colors.greenAccent,
                    onPrimary: Colors.black,
                    action: Operations.divide,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Wrap(
                spacing: 10.0,
                children: const [
                  CalcButton(
                    text: "7",
                    action: Add.seven,
                  ),
                  CalcButton(
                    text: "8",
                    action: Add.eight,
                  ),
                  CalcButton(
                    text: "9",
                    action: Add.nine,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  CalcButton(
                    text: "x",
                    primary: Colors.greenAccent,
                    onPrimary: Colors.black,
                    action: Operations.multiply,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Wrap(
                spacing: 10.0,
                children: const [
                  CalcButton(
                    text: "4",
                    action: Add.four,
                  ),
                  CalcButton(
                    text: "5",
                    action: Add.five,
                  ),
                  CalcButton(
                    text: "6",
                    action: Add.six,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  CalcButton(
                    text: "-",
                    primary: Colors.greenAccent,
                    onPrimary: Colors.black,
                    action: Operations.substract,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Wrap(
                spacing: 10.0,
                children: const [
                  CalcButton(text: "1", action: Add.one),
                  CalcButton(
                    text: "2",
                    action: Add.two,
                  ),
                  CalcButton(
                    text: "3",
                    action: Add.three,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  CalcButton(
                    text: "+",
                    primary: Colors.greenAccent,
                    onPrimary: Colors.black,
                    action: Operations.sum,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Wrap(
                spacing: 10.0,
                children: const [
                  CalcButton(
                    text: ".",
                    action: Add.dot,
                  ),
                  CalcButton(
                    text: "0",
                    action: Add.zero,
                  ),
                  CalcButton(
                    text: "AC",
                    smallText: true,
                    primary: Colors.orangeAccent,
                    onPrimary: Colors.black,
                    action: Edit.ac,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  CalcButton(
                    text: "=",
                    primary: Colors.greenAccent,
                    onPrimary: Colors.black,
                    action: Operations.equal,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
