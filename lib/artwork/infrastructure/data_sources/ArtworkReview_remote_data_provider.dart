import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/models/ArtworkReviewModel.dart';
import 'package:peru_stars_mobile/common/config/http_common.dart';

class ArtworkReviewDataProvider extends HttpCommon{
  ArtworkReviewDataProvider();
  Future<Response> createArtworkReview(ArtworkReviewModel model)async{
    Response response= await post("/api/v1/artworkreviews/hobbyist/"+model.getHobbyistId().toString()+"/artworks/"+model.getArtworkId().toString(), model.toCreateArtworkReviewJson());
    return response;
  }
  Future<Response> getArtworkByArtworkId(int artworkId)async{
    Response response= await get("/api/v1/artworkreviews/artworks/"+artworkId.toString());
    return response;
  }
}