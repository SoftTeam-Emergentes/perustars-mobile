import 'package:equatable/equatable.dart';

class Artist extends Equatable{
  final int? Id;
  final int userId;
  final int age;
  final String brandName;
  final String description;
  final String phrase;
  final int contactNumber;
  final String contactEmail;
  final String genre;
  final List<String> socialMediaLink;

  Artist({this.Id,required this.userId, required this.age, required this.brandName, required this.description, required this.phrase, required this.contactNumber, required this.contactEmail, required this.genre, required this.socialMediaLink});


  @override

  List<Object?> get props => [userId,age,brandName,description,phrase,contactNumber,contactEmail,genre,socialMediaLink];
}