import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState(true));

  void lockSelect() {
    if (state.select) {
      emit(state.copyWith(state.select = false));
      Future.delayed(
        const Duration(milliseconds: 500),
        () {
          emit(state.copyWith(state.select = true));
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
