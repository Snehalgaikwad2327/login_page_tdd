import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/user_details_repositories.dart';

class GetScreenName {
  final UserDetailsRepository repository;

  GetScreenName(this.repository);

  Future<Either<Failure, String>> call() async {
    return await repository.getScreenName();
  }
}
