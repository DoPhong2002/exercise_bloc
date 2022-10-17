import 'package:flutter_bloc/flutter_bloc.dart';

class cccc extends Cubit<int> {
  cccc() : super(0);
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
