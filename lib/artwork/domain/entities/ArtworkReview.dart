import 'dart:ffi';

import 'package:equatable/equatable.dart';

class ArtworkReview extends Equatable{
  final int? Id;
  final int ArtworkId;
  final int HobbyistId;
  final String Title;
  final String Comment;
  final DateTime ReviewDateTime;
  final Float Calification;

  ArtworkReview({this.Id, required this.ArtworkId, required this.HobbyistId,required this.Title,required this.Comment,required this.ReviewDateTime,required this.Calification});

  @override
  List<Object?> get props => [Id,ArtworkId,HobbyistId,Title,Comment,ReviewDateTime,Calification];


}