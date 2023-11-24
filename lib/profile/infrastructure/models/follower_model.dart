import 'package:peru_stars_mobile/profile/domain/entities/Follower.dart';

class FollowerModel extends Follower{
  FollowerModel({required int artistId, required int hobbyistId}) : super(artistId: artistId, hobbyistId: hobbyistId);
  factory FollowerModel.fromJson(Map<String, dynamic> json){
    return FollowerModel(artistId: json["artistId"], hobbyistId: json["hobbyistId"]);
  }
  Map<String,dynamic> toCreateFollowerJson(){
    return {
      "artistId":artistId,
      "hobbyistId":hobbyistId
    };
}
}