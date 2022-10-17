import 'package:flutter_bloc/flutter_bloc.dart';

class fs extends Cubit<int> {
  fs() : super(0);
  int couter = 0;

  void increment() {
    couter = couter + 100;
    emit(couter);
  }

  void decrement() {
    couter = couter - 10;
    emit(couter);
  }
}
