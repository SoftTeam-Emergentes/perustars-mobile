import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/models/ArtworkRecommendationModel.dart';

abstract class ArtworkRecommendationInterface{
  Future<Response> createArtworkRecommendation(int hobbyistId,int artistId,int artworkId);
  Future<List<ArtworkRecommendationModel>> getAllRecomendations();
}