import 'package:peru_stars_mobile/profile/domain/interfaces/FollowerInterface.dart';
import 'package:peru_stars_mobile/profile/infrastructure/data_source/follower_remote_data_provider.dart';
import 'package:peru_stars_mobile/profile/infrastructure/models/follower_model.dart';

class FollowerRepository implements FollowerInterface{
  late final FollowerDataProvider _followerDataProvider;
  FollowerRepository(){
    _followerDataProvider=FollowerDataProvider();
  }

  @override
  Future createFollower(int artistId, int hobbyistId) {
    FollowerModel model=FollowerModel(artistId: artistId, hobbyistId: hobbyistId);
    Future response= _followerDataProvider.followArtist(model);
    return response;
  }

  @override
  Future deleteFollowerbyHobbyistId(int hobbyistId) {
    Future response= _followerDataProvider.deleteFollowerByHobbyistId(hobbyistId);
    return response;
  }

  @override
  Future getFollowedArtistByHobbyistId(int hobbyistId) {
    Future response=_followerDataProvider.getFollowedArtistByHobbyistId(hobbyistId);
    return response;
  }

  @override
  Future getFollowerByArtistId(int artistId) {
    Future response=_followerDataProvider.getFollowersByArtistId(artistId);
    return response;
  }

}