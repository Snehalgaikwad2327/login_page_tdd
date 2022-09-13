import 'package:dartz/dartz.dart';
import 'package:flutter_login_page/feature/login_page/domain/entities/user_details.dart';

import '../../../../core/error/failure.dart';

abstract class UserDetailsRepository {
  Future<Either<Failure, UserDetails>> getUserDetails();
  Future setUserDetails(UserDetails userDetails);

  Future<Either<Failure, bool>> isRemember();
  Future setRememberData(bool value);

  Future<Either<Failure, String>> getScreenName();
  Future setScreenName(String screenName);

  Future<Either<Failure, bool>> checkLoginData(String emailId, String password);
}
