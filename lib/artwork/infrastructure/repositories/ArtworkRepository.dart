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
  Future<Response> getArtworkByArtistId(int artistId) async{
    Response response=await artworkDataProvider.getArtworkByArtistId(artistId);
    return response;
  }

  @override
  Future<Response> getArtworks() async{
    Response response= await artworkDataProvider.getAllArtworks();
    return response;
  }


}