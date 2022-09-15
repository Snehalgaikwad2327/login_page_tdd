// ignore_for_file: depend_on_referenced_packages

//  import 'dart:js_util';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_page/core/error/failure.dart';
import 'package:flutter_login_page/feature/login_page/domain/entities/user_details.dart';
import 'package:flutter_login_page/feature/login_page/domain/usecases/get_screen_name.dart';
import 'package:flutter_login_page/feature/login_page/domain/usecases/get_user_details_repositories.dart';
import 'package:flutter_login_page/feature/login_page/domain/usecases/set_user_details_repository.dart';

import '../../domain/usecases/check_login_data_repository.dart';
import '../../domain/usecases/is_remember_me_repository.dart';
import '../../domain/usecases/set_remember_data_repository.dart';
import '../../domain/usecases/set_screen_name_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  CheckLoginData checkLoginData;
  GetScreenName getScreenName;
  GetUserDetails getUserDetails;
  IsRememberMe isRememberMe;
  SetScreenName setScreenName;
  SetUserDetails setUserDetails;
  SetRememberData setRememberData;

  LoginBloc(
      {required this.checkLoginData,
      required this.getScreenName,
      required this.getUserDetails,
      required this.isRememberMe,
      required this.setRememberData,
      required this.setScreenName,
      required this.setUserDetails})
      : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<WelcomeEvent>((event, emit) {
      saveScreenName("Screen1");
      emit(WelcomeState());
    });

    on<RegisterEvent>((event, emit) {
      saveScreenName("Screen2");
      emit(Register());
    });

    on<SignInEvent>((event, emit) {
      saveScreenName("Screen3");
      emit(SignIn());
    });

    on<LoginPageEvent>((event, emit) {
      saveScreenName("Screen4");
      emit(LoginPage());
    });

    on<LogoutEvent>((event, emit) {
      saveScreenName("Screen3");
      emit(Logout());
    });
  }

  applyWelcomePage() {
    add(WelcomeEvent());
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

  void saveScreenName(String screenName) {
    setScreenName(screenName: screenName);
  }

  void saveUserDetails(UserDetails userDetails) {
    setUserDetails(userDetails: userDetails);
  }

  void saveIsRemember(bool value) {
    setRememberData(value: value);
  }

  void screenname() async {
    Either<Failure, String> either;
    either = await getScreenName();

    bool isChecked = await isGetRemember();

    either.fold((screenFailure) => add(WelcomeEvent()), (screenString) {
      print(screenString);
      if (screenString == "Screen1") {
        add(WelcomeEvent());
      } else if (screenString == "Screen2") {
        add(RegisterEvent());
      } else if (screenString == "Screen3" && isChecked == false) {
        add(SignInEvent());
      } else if (screenString == "Screen4") {
        add(LoginPageEvent());
      } else if (isChecked == true) {
        add(LogoutEvent());
      }
    });
  }

  void userDetailData() async {
    Either<Failure, UserDetails> either;
    either = await getUserDetails();

    either.fold((userDetailFailure) {
      add(WelcomeEvent());
    }, (userDetail) {});
  }

  Future<bool> isGetRemember() async {
    Either<Failure, bool> either;
    either = await isRememberMe();
    bool isChecked = false;
    either.fold((dataFailure) => add(WelcomeEvent()), (boolVal) {
      isChecked = boolVal;
    });

    return isChecked;
  }

  void checkLogin(String emailId, String password) async {
    Either<Failure, bool> either;
    either = await checkLoginData(emailId: emailId, password: password);

    either.fold((lloginFailure) => add(WelcomeEvent()), (loginData) {
      if (loginData == true) {
        add(LogoutEvent());
      } else {
        add(SignInEvent());
      }
    });
  }
}
