import 'dart:ffi';

import 'package:peru_stars_mobile/artwork/domain/entities/ArtworkReview.dart';

class ArtworkReviewModel extends ArtworkReview{
  ArtworkReviewModel({int? Id,required int ArtworkId, required int HobbyistId, required String Title, required String Comment, required DateTime ReviewDateTime, required Float Calification}) : super(Id: Id,ArtworkId: ArtworkId, HobbyistId: HobbyistId, Title: Title, Comment: Comment, ReviewDateTime: ReviewDateTime, Calification: Calification);

  factory ArtworkReviewModel.fromJson(Map<String,dynamic> json){
    return ArtworkReviewModel(ArtworkId: json["ArtworkId"], HobbyistId: json["HobbyistId"], Title: json["Tittle"], Comment: json["Comment"], ReviewDateTime: json["ReviewDateTime"], Calification: json["Calification"]);
  }
  int getArtworkId(){
    return ArtworkId;
  }
  int getHobbyistId(){
    return HobbyistId;
  }
  Map<String,dynamic> toCreateArtworkReviewJson(){
    return{
      "title":Title,
      "comment":Comment,
      "calification":Calification
    };
  }
}