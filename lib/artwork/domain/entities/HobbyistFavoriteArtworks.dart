import 'package:equatable/equatable.dart';

class HobbyistFavoriteArtworks extends Equatable{
  final int? Id;
  final int ArtworkId;
  final int HobbyistId;

  HobbyistFavoriteArtworks({this.Id, required this.ArtworkId,required this.HobbyistId});


  @override
  List<Object?> get props => [Id,ArtworkId,HobbyistId];

}