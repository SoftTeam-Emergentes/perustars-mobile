abstract class HobbyistInterface{
  Future<dynamic> createHobbyist(int userId,int age);
  Future<dynamic> getHobbyistById(int id);
  Future<dynamic> deleteHobbyistById(int id);
  Future<dynamic> editHobbyistId(int id);
}