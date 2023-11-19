import 'package:equatable/equatable.dart';

class Hobbyist extends Equatable{

  final int? id;
  final int userId;
  final int age;
  Hobbyist({this.id,required this.userId,required this.age});

  @override

  List<Object?> get props => [userId,age];
}