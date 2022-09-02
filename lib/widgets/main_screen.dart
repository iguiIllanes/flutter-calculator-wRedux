import 'package:calculadora/bloc/app_state_cubit.dart';
import 'package:calculadora/widgets/backspace_button.dart';
import 'package:calculadora/widgets/history_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/display.dart';
import '../widgets/button.dart';
import 'ac_button.dart';
import 'operation_button.dart';

class MainScreen extends StatelessWidget {
  final String title;

  const MainScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppStateCubit(),
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
                  children: const [
                    HistoryButton(),
                    BackspaceButton(),
                    SizedBox(
                      width: 15.0,
                    ),
                    OperationButton(
                      text: "/",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      operation: "/",
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
                      number: "7",
                    ),
                    CalcButton(
                      text: "8",
                      number: "8",
                    ),
                    CalcButton(
                      text: "9",
                      number: "9",
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    OperationButton(
                      text: "x",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      operation: "*",
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
                      number: "4",
                    ),
                    CalcButton(
                      text: "5",
                      number: "5",
                    ),
                    CalcButton(
                      text: "6",
                      number: "6",
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    OperationButton(
                      text: "-",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      operation: "-",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Wrap(
                  spacing: 10.0,
                  children: const [
                    CalcButton(text: "1", number: "1"),
                    CalcButton(
                      text: "2",
                      number: "2",
                    ),
                    CalcButton(
                      text: "3",
                      number: "3",
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    OperationButton(
                      text: "+",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      operation: "+",
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
                      number: ".",
                    ),
                    CalcButton(
                      text: "0",
                      number: "0",
                    ),
                    ACButton(
                      text: "AC",
                      smallText: true,
                      primary: Colors.orangeAccent,
                      onPrimary: Colors.black,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    OperationButton(
                      text: "=",
                      primary: Colors.greenAccent,
                      onPrimary: Colors.black,
                      operation: "=",
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
