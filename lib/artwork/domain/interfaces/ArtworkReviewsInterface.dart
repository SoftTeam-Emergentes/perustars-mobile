import 'dart:ffi';

import 'package:dio/dio.dart';

abstract class ArtworkReviewInterface{
  Future<Response> createArtworkReview(int hobbyistId, int artworkId,String Title,String Comment,Float Calification);
  Future<Response> getArtworkReviewById(int artworkId);
}