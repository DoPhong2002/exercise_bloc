import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState(true));

  void lockSelect() {
    if (state.select) {
      // print('lock');
      emit(state.copyWith(state.select = false));
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          emit(state.copyWith(state.select = true));
          // print('unlock');
        },
      );
    }
  }
}

class LoginState {
  bool select;

  LoginState(this.select);

  LoginState copyWith(bool select) {
    return LoginState(select);
  }
}
