import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:peru_stars_mobile/artwork/domain/ValueObjects/ArtworkContent.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/models/ArtworkModel.dart';

abstract class ArtworkInterface{
  Future<Response> createArtwork(int artistId,String Title,String Description,ArtworkContent MainContent,Float Price, ArtworkContent CoverImage);
  Future<Response> getArtworkByArtistId(int artistId);
  Future<Response> deleteArtworkById(int artworkId,int artistId);
  Future<Response> getArtworks();
  Future<Response> favoriteArtwork(int artworkId, int hobbyistId);
  Future<List<ArtworkModel>> getFavoritesArtworksByHobbyistId(int hobbyistId);
}