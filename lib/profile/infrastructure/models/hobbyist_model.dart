import 'package:peru_stars_mobile/profile/domain/entities/Hobbyist.dart';

class HobbyistModel extends Hobbyist{
  HobbyistModel({required id,required int userId, required int age}) : super(id: id,userId: userId, age: age);

  factory HobbyistModel.fromJson(Map<String, dynamic> json){
    return HobbyistModel(
        id: json["hobbyistId"],
        userId: json["userId"],
        age: json["age"]);
  }
  Map<String, dynamic> toCreateHobbyistJson(){
    return {
      "userId":userId,
      "age":age
    };
  }
}