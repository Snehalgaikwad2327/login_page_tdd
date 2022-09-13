// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<RegisterEvent>((event, emit) {
      emit(Register());
    });

    on<SignInEvent>((event, emit) {
      emit(SignIn());
    });

    on<LoginPageEvent>((event, emit) {
      emit(LoginPage());
    });

    on<LogoutEvent>((event, emit) {
      emit(Logout());
    });
  }

  applyRegister() {
    add(RegisterEvent());
  }

  applySignIn() {
    add(SignInEvent());
  }

  applyLogIn() {
    add(LoginPageEvent());
  }

  applyLogout() {
    add(LogoutEvent());
  }
}
