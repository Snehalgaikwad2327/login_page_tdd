// ignore_for_file: constant_identifier_names, unnecessary_null_comparison

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
    print("get screen name");
    String? getscreenData = sharedPreferences.getString(SCREEN_NAME);

    print("get screen data");
    print(getscreenData);

    if (getscreenData != null) {
      return Future.value(getscreenData);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<UserDetailsModel> getUserDetails() {
    print("get user details");
    final getUserData = sharedPreferences.getString(USER_DETAILS);
    if (getUserData != null) {
      List<String> str = getUserData
          .replaceAll("{", "")
          .replaceAll("}", "")
          .replaceAll("\"", "")
          .replaceAll("'", "")
          .split(",");
      Map<String, dynamic> result = {};
      for (int i = 0; i < str.length; i++) {
        List<String> s = str[i].split(":");
        result.putIfAbsent(s[0].trim(), () => s[1].trim());
      }
      return Future.value(UserDetailsModel.fromJson(result));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> isRemember() {
    print("get remember data");
    final isRememberData = sharedPreferences.getBool(BOOL_DATA);
    if (isRememberData != null) {
      return Future.value(isRememberData);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<bool> setRememberData(bool value) {
    print("set remember data");
    final setRemember = sharedPreferences.setBool(BOOL_DATA, value);
    if (setRemember != null) {
      return Future.value(setRemember);
    } else {
      throw CacheException();
    }
  }

  @override
  Future setScreenName(String screenName) {
    print("set screen name");

    return Future.value(sharedPreferences.setString(SCREEN_NAME, screenName));
  }

  @override
  Future<bool> setUserDetails(UserDetailsModel userDetailsModel) {
    print("set user data");
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
    print("check login data");
    UserDetailsModel userDetailsModel = await getUserDetails();

    if (userDetailsModel.emailId == emailId &&
        userDetailsModel.password == password) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
