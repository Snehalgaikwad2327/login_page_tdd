// ignore_for_file: file_names

import 'package:flutter_login_page/feature/login_page/domain/entities/user_details.dart';

class UserDetailsModel extends UserDetails {
  const UserDetailsModel(
      {required super.name,
      required super.age,
      required super.emailId,
      required super.password});

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
        name: json['name'],
        age: json['age'],
        emailId: json['emailId'],
        password: json['passwors']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'age': age, 'emailId': emailId, 'password': password};
  }
}
