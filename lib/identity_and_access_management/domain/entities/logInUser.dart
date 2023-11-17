import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LogInUser {
  LogInUser({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
});
 final String firstName;
 final String lastName;
 final String email;
 final String password;
}
