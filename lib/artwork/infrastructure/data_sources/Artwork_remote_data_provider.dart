import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/models/ArtworkModel.dart';
import 'package:peru_stars_mobile/common/config/http_common.dart';
import 'package:peru_stars_mobile/common/config/mini-storage.dart' as miniStorage;

class ArtworkDataProvider extends HttpCommon{
  ArtworkDataProvider();
  Future<Response> createArtwork(ArtworkModel model)async {
      String token = await miniStorage.readAsync("token");
      Response response= await post("/api/v1/artworks/artists/"+model.getArtistId().toString(), model.toRegisterArtworkJson(), token: token);
      return response;
  }
  Future<Response> getAllArtworks()async{
    String token = await miniStorage.readAsync("token");
    Response response= await get("/api/v1/artworks");
    return response;
  }
  Future<Response> getArtworkByArtistId(int artistId)async{
    String token = await miniStorage.readAsync("token");
    Response response= await get("/api/v1/artworks/artists/"+artistId.toString(), token: token);
    return response;
  }
  Future<Response> deleteArtworkById(int artworkId,int artistId)async{
    String token = await miniStorage.readAsync("token");
    Response response= await delete("/api/v1/artworks/artists/"+artistId.toString()+"/"+artworkId.toString(), token: token);
    return response;
  }
  Future<Response> createFavoriteArtwork(int artworkId,int hobbyistId)async{
    String token = await miniStorage.readAsync("token");
    Response response=await post("/api/v1/hobbyistfavoriteartworks/artworks/${artworkId.toString()}/hobbyists/${hobbyistId.toString()}", {}, token: token);
    return response;
  }
  Future<Response> getFavoriteArtwork(int hobbyistId)async{
    String token = await miniStorage.readAsync("token");
    Response response= await get("/api/v1/hobbyistfavoriteartworks/hobbyists/${hobbyistId.toString()}/artworks", token: token);
    return response;
  }

}