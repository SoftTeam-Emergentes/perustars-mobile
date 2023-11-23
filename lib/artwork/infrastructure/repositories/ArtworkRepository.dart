import 'dart:convert';
import 'dart:ffi';
import 'package:dio/src/response.dart';
import 'package:peru_stars_mobile/artwork/domain/ValueObjects/ArtworkContent.dart';
import 'package:peru_stars_mobile/artwork/domain/enum/ArtworkStatus.dart';
import 'package:peru_stars_mobile/artwork/domain/interfaces/ArtworkInterface.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/data_sources/Artwork_remote_data_provider.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/models/ArtworkModel.dart';

class ArtworkRepository implements ArtworkInterface{
  late final ArtworkDataProvider artworkDataProvider;
  ArtworkRepository(){
    artworkDataProvider=ArtworkDataProvider();
  }

  @override
  Future<Response> createArtwork(int artistId, String Title, String Description, ArtworkContent MainContent, Float Price, ArtworkContent CoverImage)async {
    ArtworkModel model=ArtworkModel(ArtistId: artistId,Title: Title,Description: Description,MainContent: MainContent,Price: Price,CoverImage: CoverImage,PublishedAt: DateTime.now(),Status: ArtworkStatus.AVAILABLE);
    Response response=await artworkDataProvider.createArtwork(model);
    return response;
  }

  @override
  Future<Response> deleteArtworkById(int artworkId,int artistId) async{
    Response response=await artworkDataProvider.deleteArtworkById(artworkId, artistId);
    return response;
  }

  @override
  Future<List<ArtworkModel>> getArtworkByArtistId(int artistId) async{
    Response response=await artworkDataProvider.getArtworkByArtistId(artistId);
    List<dynamic> listApi=json.decode(response.data);
    List<ArtworkModel> listResponse=listApi.map((e) => ArtworkModel.fromJson(e)).toList();
    return listResponse;
  }

  @override
  Future<List<ArtworkModel>> getArtworks() async{
    Response response= await artworkDataProvider.getAllArtworks();
    List<dynamic> listApi=json.decode(response.data);
    List<ArtworkModel> listResponse=listApi.map((e) => ArtworkModel.fromJson(e)).toList();
    return listResponse;
  }

  @override
  Future<Response> favoriteArtwork(int artworkId, int hobbyistId) async{
    Response response= await artworkDataProvider.createFavoriteArtwork(artworkId, hobbyistId);
    return response;
  }

  @override
  Future<List<ArtworkModel>> getFavoritesArtworksByHobbyistId(int hobbyistId) async{
    try{
      Response response=await artworkDataProvider.getFavoriteArtwork(hobbyistId);
      List<dynamic> listApi=json.decode(response.data);
      List<ArtworkModel> favoriteArtworks=listApi.map((e) => ArtworkModel.fromJson(e)).toList();
      return favoriteArtworks;
    }catch(e){
      throw Exception("Something went wrong in favorites artworks, error: "+e.toString());
    }

  }


}