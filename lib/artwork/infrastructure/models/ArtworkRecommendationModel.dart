import 'package:peru_stars_mobile/artwork/domain/entities/ArtworkRecomendation.dart';

class ArtworkRecommendationModel extends ArtworkRecomendation{
  ArtworkRecommendationModel({int? Id,required int HobbyistId, required int ArtistId, required int ArtworkId, required DateTime RecommendationDateTime, required bool Collected}) : super(Id:Id, HobbyistId: HobbyistId, ArtistId: ArtistId, ArtworkId: ArtworkId, RecommendationDateTime: RecommendationDateTime, Collected: Collected);

  factory ArtworkRecommendationModel.fromJson(Map<String,dynamic> json){
    return ArtworkRecommendationModel(Id: json["id"],HobbyistId: json["hobbyistId"], ArtistId: json["artistId"], ArtworkId: json["artworkId"], RecommendationDateTime: json["recommendationDateTime"], Collected: false);
  }

  Map<String,dynamic> toJson(){
    return{
      "hobbyistId":HobbyistId,
      "artistId":ArtistId,
      "artworkId":ArtworkId
    };
  }
}