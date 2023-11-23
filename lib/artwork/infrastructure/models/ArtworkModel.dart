import 'dart:ffi';

import 'package:peru_stars_mobile/artwork/domain/ValueObjects/ArtworkContent.dart';

import 'package:peru_stars_mobile/artwork/domain/enum/ArtworkStatus.dart';

import '../../domain/entities/ArtWork.dart';

class ArtworkModel extends ArtWork{
  ArtworkModel({int? Id,required String Title, required String Description, required ArtworkContent MainContent, required Float Price, required ArtworkContent CoverImage, required DateTime PublishedAt, required ArtworkStatus Status, required int ArtistId}) : super(Id:Id,Title: Title, Description: Description, MainContent: MainContent, Price: Price, CoverImage: CoverImage, PublishedAt: PublishedAt, Status: Status, ArtistId: ArtistId);

  factory ArtworkModel.fromJson(Map<String,dynamic> json){
    ArtworkContent MainContent=ArtworkContent(json["mainContent"]["content"], json["mainContent"]["format"]);
    ArtworkContent CoverImage=ArtworkContent(json["coverImage"]["content"], json["coverImage"]["format"]);
    return ArtworkModel(Id: json["id"],Title: json["title"], Description: json["description"], MainContent: MainContent, Price: json["price"], CoverImage: CoverImage, PublishedAt: json["publishedAt"], Status: json["status"], ArtistId:json["artistId"]);
  }
  Map<String,dynamic> toRegisterArtworkJson(){
    return{
      'title': Title,
      'description':Description,
      'mainContent': {
        'content':MainContent.Content,
        'format':MainContent.Format
      },
      'price':Price,
      'artworkContent':{
        'content':CoverImage.Content,
        'format':CoverImage.Format
      }
    };
  }
}