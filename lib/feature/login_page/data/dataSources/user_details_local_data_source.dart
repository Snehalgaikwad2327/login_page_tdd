// ignore_for_file: constant_identifier_names, unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter_login_page/core/error/exception.dart';
import 'package:flutter_login_page/feature/login_page/data/models/user_details-model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/user_details.dart';

abstract class UserDetailsLocalDataSource {
  Future<UserDetails> getUserDetails();
  Future setUserDetails(UserDetailsModel userDetailsModel);

  Future<bool> isRemember();
  Future setRememberData(bool value);

  Future<String> getScreenName();
  Future setScreenName(String screenName);

  Future<bool> checkLoginData(String emailId, String password);
}

const SCREEN_NAME = 'SCREEN_NAME';
const USER_DETAILS = 'USER_DETAILS';
const BOOL_DATA = ' BOOL_DATA';

class UserDetailsLocalDataSourceImpl implements UserDetailsLocalDataSource {
  final SharedPreferences sharedPreferences;

  UserDetailsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<String> getScreenName() {
    final getscreenData = sharedPreferences.getString(SCREEN_NAME);
    if (getscreenData != null) {
      return Future.value(getscreenData);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<UserDetailsModel> getUserDetails() {
    final getUserData = sharedPreferences.getString(USER_DETAILS);
    if (getUserData != null) {
      return Future.value(UserDetailsModel.fromJson(json.decode(getUserData)));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> isRemember() {
    final isRememberData = sharedPreferences.getBool(BOOL_DATA);
    if (isRememberData != null) {
      return Future.value(true);
    } else {
      throw CacheException();
    }
  }

  @override
  Future setRememberData(bool value) {
    final setRemember = sharedPreferences.setBool(BOOL_DATA, value);
    if (setRemember != null) {
      return Future.value(setRemember);
    } else {
      throw CacheException();
    }
  }

  @override
  Future setScreenName(String screenName) {
    final setscreenData = sharedPreferences.getString(SCREEN_NAME);
    if (setscreenData != null) {
      return Future.value(setscreenData);
    } else {
      throw CacheException();
    }
  }

  @override
  Future setUserDetails(UserDetailsModel userDetailsModel) {
    final setUserData = sharedPreferences.setString(
        USER_DETAILS, userDetailsModel.toJson().toString());
    if (setUserData != null) {
      return Future.value(setUserData);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> checkLoginData(String emailId, String password) async {
    UserDetailsModel userDetailsModel = await getUserDetails();

    if (userDetailsModel.emailId == emailId &&
        userDetailsModel.password == password) {
      return Future.value(true);
    } else {
      throw CacheException();
    }
  }
}
