import 'dart:ffi';

import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';

abstract class ArtEventInterface {
  Future<List<ArtEvent>> getArtEventsByHobbyistId(Long hobbyistId);
  Future<List<ArtEvent>> getArtEventsByArtistId(Long artistId);
  Future<String> startArtEvent(Long artEventId);
  Future<String> cancelArtEvent(Long artEventId);
  Future<String> editArtEvent(Long artEventId);
  Future<List<ArtEvent>> getAllEvents();
}