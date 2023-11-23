import 'package:peru_stars_mobile/profile/infrastructure/models/artist_model.dart';
import 'package:peru_stars_mobile/profile/infrastructure/models/follower_model.dart';

abstract class FollowerInterface{
  Future createFollower(int artistId,int hobbyistId);
  Future<List<FollowerModel>> getFollowerByArtistId(int artistId);
  Future deleteFollowerbyHobbyistId(int hobbyistId);
  Future<List<ArtistModel>> getFollowedArtistByHobbyistId(int hobbyistId);
}