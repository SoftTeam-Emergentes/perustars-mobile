import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/profile/domain/interfaces/FollowerInterface.dart';
import 'package:peru_stars_mobile/profile/infrastructure/data_source/follower_remote_data_provider.dart';
import 'package:peru_stars_mobile/profile/infrastructure/models/follower_model.dart';

class FollowerRepository implements FollowerInterface{
  late final FollowerDataProvider _followerDataProvider;
  FollowerRepository(){
    _followerDataProvider=FollowerDataProvider();
  }

  @override
  Future createFollower(int artistId, int hobbyistId) async{
    FollowerModel model=FollowerModel(artistId: artistId, hobbyistId: hobbyistId);
    Response response= await _followerDataProvider.followArtist(model);
    return response;
  }

  @override
  Future deleteFollowerbyHobbyistId(int hobbyistId) async{
    Response response= await _followerDataProvider.deleteFollowerByHobbyistId(hobbyistId);
    return response;
  }

  @override
  Future getFollowedArtistByHobbyistId(int hobbyistId)async {
    Response response=await _followerDataProvider.getFollowedArtistByHobbyistId(hobbyistId);
    return response;
  }

  @override
  Future getFollowerByArtistId(int artistId)async {
    Response response=await _followerDataProvider.getFollowersByArtistId(artistId);
    return response;
  }

}