import 'package:dio/src/response.dart';
import 'package:peru_stars_mobile/artwork/domain/interfaces/ArtworkRecommendationInterface.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/data_sources/ArtworkRecommendation_data_provider.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/models/ArtworkRecommendationModel.dart';
import 'dart:convert';
class ArtworkRecommendationRepository implements ArtworkRecommendationInterface{
  late final ArtworkRecommendationDataProvider artworkRecommendationDataProvider;
  ArtworkRecommendationRepository(){
    artworkRecommendationDataProvider=ArtworkRecommendationDataProvider();
  }

  @override
  Future<Response> createArtworkRecommendation(int hobbyistId, int artistId, int artworkId  ) async{
    try{
      Response response=await artworkRecommendationDataProvider.createArtworkRecommendation(hobbyistId, artistId, artworkId);
      return response;
    }catch(e){
      throw Exception("Something went wrong, error: "+e.toString());
    }
  }

  @override
  Future<List<ArtworkRecommendationModel>> getAllRecomendations() async{
    try{
      Response response=await artworkRecommendationDataProvider.getArtworkRecommendations();
      List<dynamic> listApi=json.decode(response.data);
      List<ArtworkRecommendationModel> listRecommendations=listApi.map((e) => ArtworkRecommendationModel.fromJson(e)).toList();
      return listRecommendations;
    }catch(e){
      throw Exception("Something went wrong getting all recommendations,error: "+e.toString());
    }
  }

}