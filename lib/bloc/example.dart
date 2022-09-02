import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiceFaceCubit extends Cubit<int> {
  DiceFaceCubit() : super(0); // estado inicial?

  void rollDice() {
    int number;
    do {
      number = Random().nextInt(6);
    } while (number == 0);
    emit(number);
  }
}
