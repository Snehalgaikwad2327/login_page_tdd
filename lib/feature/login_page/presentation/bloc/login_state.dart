part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class Register extends LoginState {}

class SignIn extends LoginState {}

class LoginPage extends LoginState {}

class Logout extends LoginState {}
