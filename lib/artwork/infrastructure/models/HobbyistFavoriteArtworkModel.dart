import 'package:peru_stars_mobile/artwork/domain/entities/HobbyistFavoriteArtworks.dart';

class HobbyistFavoriteArtworkModel extends HobbyistFavoriteArtworks{
  HobbyistFavoriteArtworkModel({int? Id,required int ArtworkId, required int HobbyistId}) : super(Id:Id, ArtworkId: ArtworkId, HobbyistId: HobbyistId);
  
  factory HobbyistFavoriteArtworkModel.fromJson(Map<String,dynamic> json){
    return HobbyistFavoriteArtworkModel(Id: json["id"],ArtworkId: json["artworkId"], HobbyistId: json["hobbyistId"]);
  }
}