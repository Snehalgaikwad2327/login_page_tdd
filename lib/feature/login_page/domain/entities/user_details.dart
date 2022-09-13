import 'package:equatable/equatable.dart';

class UserDetails extends Equatable {
  final String name;
  final int age;
  final String emailId;
  final String password;

  const UserDetails(
      {required this.name,
      required this.age,
      required this.emailId,
      required this.password});

  @override
  List<Object?> get props => throw UnimplementedError();
}
