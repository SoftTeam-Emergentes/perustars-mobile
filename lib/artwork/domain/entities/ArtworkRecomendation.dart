import 'package:equatable/equatable.dart';

class ArtworkRecomendation extends Equatable{
  final int? Id;
  final int HobbyistId;
  final int ArtistId;
  final int ArtworkId;
  final DateTime RecommendationDateTime;
  final bool Collected;

  ArtworkRecomendation({this.Id,required this.HobbyistId,required this.ArtistId,required this.ArtworkId,required this.RecommendationDateTime,required this.Collected});

  @override
  List<Object?> get props => [Id,HobbyistId,ArtistId,ArtworkId,RecommendationDateTime,Collected];
}