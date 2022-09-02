import 'package:calculadora/bloc/app_state.dart';
import 'package:calculadora/bloc/app_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 250.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<AppStateCubit, AppState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    state.current,
                    style: const TextStyle(fontSize: 50.0),
                  ),
                  Text(
                    state.operacion,
                    style:
                        const TextStyle(fontSize: 25.0, color: Colors.white60),
                  ),
                  Text(
                    state.result,
                    style: const TextStyle(
                        fontSize: 40.0, color: Colors.greenAccent),
                  )
                ],
              );
            },
          ),
        ));
  }
}
