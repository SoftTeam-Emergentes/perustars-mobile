abstract class FollowerInterface{
  Future createFollower(int artistId,int hobbyistId);
  Future getFollowerByArtistId(int artistId);
  Future deleteFollowerbyHobbyistId(int hobbyistId);
  Future getFollowedArtistByHobbyistId(int hobbyistId);
}