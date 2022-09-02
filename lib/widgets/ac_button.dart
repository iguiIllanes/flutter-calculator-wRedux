import 'package:calculadora/bloc/app_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ACButton extends StatelessWidget {
  final String text;
  final Color primary;
  final Color onPrimary;
  final bool smallText;
  const ACButton({
    Key? key,
    required this.text,
    this.primary = const Color(0xFF424242),
    this.onPrimary = const Color(0xFFFFFFFF),
    this.smallText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 1000.0,
      child: ElevatedButton(
        onPressed: () => BlocProvider.of<AppStateCubit>(context).acPressed(),
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
