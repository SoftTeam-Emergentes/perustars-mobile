import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/models/ArtworkModel.dart';
import 'package:peru_stars_mobile/common/config/http_common.dart';

class ArtworkDataProvider extends HttpCommon{
  ArtworkDataProvider();
  Future<Response> createArtwork(ArtworkModel model)async {
      Response response= await post("/api/v1/artworks/artists/"+model.getArtistId().toString(), model.toRegisterArtworkJson());
      return response;
  }
  Future<Response> getAllArtworks()async{
    Response response= await get("/api/v1/artworks");
    return response;
  }
  Future<Response> getArtworkByArtistId(int artistId)async{
    Response response= await get("/api/v1/artworks/artists/"+artistId.toString());
    return response;
  }
  Future<Response> deleteArtworkById(int artworkId,int artistId)async{
    Response response= await delete("/api/v1/artworks/artists/"+artistId.toString()+"/"+artworkId.toString());
    return response;
  }
  Future<Response> createFavoriteArtwork(int artworkId,int hobbyistId)async{
    Response response=await post("/api/v1/hobbyistfavoriteartworks/artworks/${artworkId.toString()}/hobbyists/${hobbyistId.toString()}", {});
    return response;
  }
  Future<Response> getFavoriteArtwork(int hobbyistId)async{
    Response response= await get("/api/v1/hobbyistfavoriteartworks/hobbyists/${hobbyistId.toString()}/artworks");
    return response;
  }

}