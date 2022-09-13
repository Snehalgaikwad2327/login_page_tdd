import 'package:dartz/dartz.dart';
import 'package:flutter_login_page/feature/login_page/domain/repositories/user_details_repositories.dart';

import '../../../../core/error/failure.dart';

class SetScreenName {
  final UserDetailsRepository repository;

  SetScreenName(this.repository);

  Future<Either<Failure, String>> call({
    required String screenName,
  }) async {
    return await repository.setScreenName(screenName);
  }
}
