import 'package:calculadora/redux/actions.dart';
import 'package:calculadora/widgets/backspace_button.dart';
import 'package:calculadora/widgets/history_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../widgets/display.dart';
import '../widgets/button.dart';

//para redux
import '../redux/reducer.dart';


class MainScreen extends StatelessWidget {
  final Store<AppState> store;
  final String title;

  const MainScreen({
    Key? key,
    required this.store,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
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
                  children: const[
                    HistoryButton(),
                    BackspaceButton(),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "/",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      action: Operations.Divide,
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
                      action: Add.Seven,
                    ),
                    CalcButton(
                      text: "8",
                      action: Add.Eight,
                    ),
                    CalcButton(
                      text: "9",
                      action: Add.Nine,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "x",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      action: Operations.Multiply,
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
                      action: Add.Four,
                    ),
                    CalcButton(
                      text: "5",
                      action: Add.Five,
                    ),
                    CalcButton(
                      text: "6",
                      action: Add.Six,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "-",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      action: Operations.Substract,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Wrap(
                  spacing: 10.0,
                  children: const [
                    CalcButton(text: "1", action: Add.One),
                    CalcButton(
                      text: "2",
                      action: Add.Two,
                    ),
                    CalcButton(
                      text: "3",
                      action: Add.Three,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "+",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      action: Operations.Sum,
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
                      action: Add.Dot,
                    ),
                    CalcButton(
                      text: "0",
                      action: Add.Zero,
                    ),
                    CalcButton(
                      text: "AC",
                      smallText: true,
                      primary: Colors.orangeAccent,
                      onPrimary: Colors.black,
                      action: Edit.AC,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    CalcButton(
                      text: "=",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      action: Operations.Equal,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
