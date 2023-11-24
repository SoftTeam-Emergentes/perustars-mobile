import 'package:equatable/equatable.dart';

class User extends Equatable{
  User({
     required this.firstName, required this.lastName, required this.email,required this.password
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;




  @override
  List<Object?> get props => <dynamic>[firstName,lastName,email,password];
}