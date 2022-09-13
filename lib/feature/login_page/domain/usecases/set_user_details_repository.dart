import '../entities/user_details.dart';
import '../repositories/user_details_repositories.dart';

class SetUserDetails {
  final UserDetailsRepository repository;

  SetUserDetails(this.repository);

  Future<UserDetails> call({
    required UserDetails userDetails,
  }) async {
    return await repository.setUserDetails(userDetails);
  }
}
