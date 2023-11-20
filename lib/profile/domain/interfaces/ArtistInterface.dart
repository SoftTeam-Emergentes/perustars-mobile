abstract class ArtistInterface{
  Future<dynamic> CreateArtist(int userId,int age,String brandName,String description,String phrase,int contactNumber,String contactEmail,String genre,List<String> socialMediaLink);
  Future<dynamic> GetAllArtist();
  Future<dynamic> GetArtistById(int id);
  Future<dynamic> DeleteArtistById(int id);
  Future<dynamic> EditArtistById(int id);
}