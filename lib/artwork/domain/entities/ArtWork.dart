import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:peru_stars_mobile/artwork/domain/ValueObjects/ArtworkContent.dart';
import 'package:peru_stars_mobile/artwork/domain/enum/ArtworkStatus.dart';

class ArtWork extends Equatable{
  final int? Id;
  final String Title;
  final String Description;
  final ArtworkContent MainContent;
  final Float Price;
  final ArtworkContent CoverImage;
  final DateTime PublishedAt;
  final ArtworkStatus Status;
  final int ArtistId;

  ArtWork({this.Id, required this.Title, required this.Description, required this.MainContent, required this.Price, required this.CoverImage, required this.PublishedAt, required this.Status,required this.ArtistId});

  int getArtistId(){return this.ArtistId;}

  @override

  List<Object?> get props => [Id,Title,Description,MainContent,Price,CoverImage,PublishedAt,Status,ArtistId];

}