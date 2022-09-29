import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountCubit extends Cubit<CountState> {
  CountCubit() : super(CountState());
int count = 0 ;

  void increase() {
    count = count + 1;
    emit(CountState());
  }

  void setUp(){
    emit(CountState());
  }

  void decrease() {
    count = count - 1;
    emit(CountState());
  }
}
class CountState{}

