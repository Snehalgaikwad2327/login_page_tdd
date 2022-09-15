import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_details.dart';
import '../repositories/user_details_repositories.dart';

class SetUserDetails {
  final UserDetailsRepository repository;

  SetUserDetails(this.repository);

  Future<Either<Failure, bool>> call({
    required UserDetails userDetails,
  }) async {
    return await repository.setUserDetails(userDetails);
  }
}
