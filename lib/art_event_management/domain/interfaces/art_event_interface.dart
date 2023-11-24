import 'dart:ffi';

import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';

abstract class ArtEventInterface {
  Future<List<ArtEvent>> getArtEventsByHobbyistId(BigInt hobbyistId);
  Future<List<ArtEvent>> getArtEventsByArtistId(BigInt artistId);
  Future<String> startArtEvent(BigInt artEventId);
  Future<String> cancelArtEvent(BigInt artEventId);
  Future<String> editArtEvent(BigInt artEventId);
  Future<List<ArtEvent>> getAllEvents();
  Future<String> addNewArtEvent(ArtEvent artEvent);
}