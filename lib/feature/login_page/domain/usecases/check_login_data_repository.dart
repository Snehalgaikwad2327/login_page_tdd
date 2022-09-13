import 'package:dartz/dartz.dart';
import 'package:flutter_login_page/feature/login_page/domain/repositories/user_details_repositories.dart';

import '../../../../core/error/failure.dart';

class CheckLoginData {
  final UserDetailsRepository repository;

  CheckLoginData(this.repository);

  Future<Either<Failure, bool>> call(
      {required String emailId, required String password}) async {
    return await repository.checkLoginData(emailId, password);
  }
}
