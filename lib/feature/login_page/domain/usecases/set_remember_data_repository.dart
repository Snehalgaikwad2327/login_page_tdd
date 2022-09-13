import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/user_details_repositories.dart';

class SetRememberData {
  final UserDetailsRepository repository;

  SetRememberData(this.repository);

  Future<Either<Failure, bool>> call({
    required bool value,
  }) async {
    return await repository.setRememberData(value);
  }
}
