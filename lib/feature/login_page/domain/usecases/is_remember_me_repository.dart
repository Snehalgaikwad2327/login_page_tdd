import 'package:dartz/dartz.dart';
import 'package:flutter_login_page/feature/login_page/domain/repositories/user_details_repositories.dart';

import '../../../../core/error/failure.dart';

class IsRememberMe {
  final UserDetailsRepository repository;

  IsRememberMe(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.isRemember();
  }
}
