// ignore_for_file: depend_on_referenced_packages

import 'dart:js_util';

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

  void userDetails() {
    Either<Failure, UserDetails> eitherData;
  }

  void screenname() async {
    Either<Failure, String> either;
    either = await getScreenName();

    either.fold((screenFailure) => null, (screenString) => null);
  }

  void userDetailData() async {
    Either<Failure, UserDetails> either;
    either = await getUserDetails();

    either.fold((userDetailFailure) => null, (userDetail) => null);
  }

  void isGetRemember() async {
    Either<Failure, bool> either;
    either = await isRememberMe();

    either.fold((dataFailure) => null, (boolVal) => null);
  }

  void saveLoginData(String emailId, String password) async {
    Either<Failure, bool> either;
    either = await checkLoginData(emailId: emailId, password: password);

    either.fold((lloginFailure) => null, (loginData) => null);
  }
}
