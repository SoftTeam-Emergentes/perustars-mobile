import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/models/ArtworkReviewModel.dart';

abstract class ArtworkReviewInterface{
  Future<Response> createArtworkReview(int hobbyistId, int artworkId,String Title,String Comment,Float Calification);
  Future<List<ArtworkReviewModel>> getArtworkReviewById(int artworkId);
}