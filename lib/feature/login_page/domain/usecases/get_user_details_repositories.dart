import 'package:dartz/dartz.dart';
import 'package:flutter_login_page/feature/login_page/domain/entities/user_details.dart';
import 'package:flutter_login_page/feature/login_page/domain/repositories/user_details_repositories.dart';

import '../../../../core/error/failure.dart';

class GetUserDetails {
  final UserDetailsRepository repository;

  GetUserDetails(this.repository);

  Future<Either<Failure, UserDetails>> call() async {
    return await repository.getUserDetails();
  }
}
