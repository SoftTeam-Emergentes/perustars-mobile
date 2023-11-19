import 'package:equatable/equatable.dart';

class Hobbyist extends Equatable{

  final int userId;
  final int age;
  Hobbyist({required this.userId,required this.age});

  @override

  List<Object?> get props => [userId,age];
}