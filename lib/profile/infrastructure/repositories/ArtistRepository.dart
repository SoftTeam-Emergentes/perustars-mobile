import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/profile/domain/interfaces/ArtistInterface.dart';
import 'package:peru_stars_mobile/profile/infrastructure/data_source/artist_remote_data_provider.dart';
import 'package:peru_stars_mobile/profile/infrastructure/models/artist_model.dart';

class ArtistRepository implements ArtistInterface{
  late final ArtistRemoteDataProvider _artistRemoteDataProvider;
  ArtistRepository(){
    _artistRemoteDataProvider=ArtistRemoteDataProvider();
  }
  @override
  Future CreateArtist(int userId, int age, String brandName, String description, String phrase, int contactNumber, String contactEmail, String genre, List<String> socialMediaLink) async{
    ArtistModel artistModel=ArtistModel(Id: 0, userId: userId, age: age, brandName: brandName, description: description, phrase: phrase, contactNumber: contactNumber, contactEmail: contactEmail, genre: genre, socialMediaLink: socialMediaLink);
    Response response=await _artistRemoteDataProvider.createArtist(artistModel);
    return response;
  }

  @override
  Future DeleteArtistById(int id)async {
    Response response=await _artistRemoteDataProvider.deleteArtistById(id);
    return response;
  }

  @override
  Future EditArtistById(int id) async{

    throw UnimplementedError();
  }

  @override
  Future GetAllArtist() async {
    Response response=await _artistRemoteDataProvider.getAllArtist();
    return response;
  }

  @override
  Future GetArtistById(int id) async{
    Response response=await _artistRemoteDataProvider.getArtistByArtistId(id);
    return response;
  }
}