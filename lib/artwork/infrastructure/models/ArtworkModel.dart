import 'dart:ffi';

import 'package:peru_stars_mobile/artwork/domain/ValueObjects/ArtworkContent.dart';

import 'package:peru_stars_mobile/artwork/domain/enum/ArtworkStatus.dart';

import '../../domain/entities/ArtWork.dart';

class ArtworkModel extends ArtWork{
  ArtworkModel({int? Id,required String Title, required String Description, required ArtworkContent MainContent, required Float Price, required ArtworkContent CoverImage, required DateTime PublishedAt, required ArtworkStatus Status, required int ArtistId}) : super(Id:Id,Title: Title, Description: Description, MainContent: MainContent, Price: Price, CoverImage: CoverImage, PublishedAt: PublishedAt, Status: Status, ArtistId: ArtistId);

  factory ArtworkModel.fromJson(Map<String,dynamic> json){
    return ArtworkModel(Id: json["Id"],Title: json["Title"], Description: json["Description"], MainContent: json["MainContent"], Price: json["Price"], CoverImage: json["CoverImage"], PublishedAt: json["PublishedAt"], Status: json["Status"], ArtistId:json["ArtistId"]);
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