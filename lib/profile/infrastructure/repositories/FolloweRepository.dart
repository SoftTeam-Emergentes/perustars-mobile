import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/profile/domain/interfaces/FollowerInterface.dart';
import 'package:peru_stars_mobile/profile/infrastructure/data_source/follower_remote_data_provider.dart';
import 'package:peru_stars_mobile/profile/infrastructure/models/artist_model.dart';
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
  Future<List<ArtistModel>> getFollowedArtistByHobbyistId(int hobbyistId)async {
    Response response=await _followerDataProvider.getFollowedArtistByHobbyistId(hobbyistId);
    List<dynamic> listApi=json.decode(response.data);
    List<ArtistModel> listResponse=listApi.map((e) => ArtistModel.fromJson(e)).toList();
    return listResponse;
  }

  @override
  Future<List<FollowerModel>> getFollowerByArtistId(int artistId)async {
    Response response=await _followerDataProvider.getFollowersByArtistId(artistId);
    List<dynamic> listApi=json.decode(response.data);
    List<FollowerModel> listResponse=listApi.map((e) => FollowerModel.fromJson(e)).toList();
    return listResponse;
  }

}