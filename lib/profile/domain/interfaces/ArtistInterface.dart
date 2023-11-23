import 'package:peru_stars_mobile/profile/infrastructure/models/artist_model.dart';

abstract class ArtistInterface{
  Future<dynamic> CreateArtist(int userId,int age,String brandName,String description,String phrase,int contactNumber,String contactEmail,String genre,List<String> socialMediaLink);
  Future<List<ArtistModel>> GetAllArtist();
  Future<ArtistModel> GetArtistById(int id);
  Future<dynamic> DeleteArtistById(int id);
  Future<dynamic> EditArtistById(int id);
}