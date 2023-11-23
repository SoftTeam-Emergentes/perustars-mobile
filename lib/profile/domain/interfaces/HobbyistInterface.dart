import 'package:peru_stars_mobile/profile/infrastructure/models/hobbyist_model.dart';

abstract class HobbyistInterface{
  Future<dynamic> createHobbyist(int userId,int age);
  Future<HobbyistModel> getHobbyistById(int id);
  Future<dynamic> deleteHobbyistById(int id);
  Future<dynamic> editHobbyistId(int id);
}