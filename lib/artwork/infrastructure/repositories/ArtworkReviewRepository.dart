import 'dart:convert';
import 'dart:ffi';

import 'package:dio/src/response.dart';
import 'package:peru_stars_mobile/artwork/domain/interfaces/ArtworkReviewsInterface.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/data_sources/ArtworkReview_remote_data_provider.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/models/ArtworkReviewModel.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/models/CreateArtworkReviewModel.dart';

class ArtworkReviewRepository implements ArtworkReviewInterface{
  late final ArtworkReviewDataProvider artworkReviewDataProvider;
  ArtworkReviewRepository(){
    artworkReviewDataProvider=ArtworkReviewDataProvider();
  }

  @override
  Future<Response> createArtworkReview(int hobbyistId, int artworkId, String Title, String Comment, Float Calification) async{
    try{
      CreateArtworkReviewModel model=CreateArtworkReviewModel(hobbyistId: hobbyistId, artworkId: artworkId, title: Title, comment: Comment, calification: Calification);
      Response response= await artworkReviewDataProvider.createArtworkReview(model);
      return response;
    }
    catch(e){
      throw Exception("Something went wrong, error: "+e.toString());
    }
  }

  @override
  Future<List<ArtworkReviewModel>> getArtworkReviewById(int artworkId) async{
    try{
      Response response=await artworkReviewDataProvider.getArtworkByArtworkId(artworkId);
      List<dynamic> resApi=json.decode(response.data);
      List<ArtworkReviewModel> listResponse=resApi.map((e) => ArtworkReviewModel.fromJson(e)).toList();
      return listResponse;
    }catch(e){
      throw Exception("Something went wrong, error: "+e.toString());
    }
  }

}