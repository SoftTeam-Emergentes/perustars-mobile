import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/common/config/http_common.dart';

class ArtworkRecommendationDataProvider extends HttpCommon{
  ArtworkRecommendationDataProvider();
  Future<Response> createArtworkRecommendation(int hobbyistId,int artistId,int artworkId)async{
    Response response=await post("/api/v1/artworkrecommendations/hobbyists/"+hobbyistId.toString()+"/artists/"+artistId.toString()+"/artworks/"+artistId.toString(),{});
    return response;
  }
  Future<Response> getArtworkRecommendations()async{
    Response response= await get("/api/v1/artworkrecommendations");
    return response;
  }
}