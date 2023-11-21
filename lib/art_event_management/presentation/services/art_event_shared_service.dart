import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';

class ArtEventSharedService {
  ArtEventSharedService();
  List<ArtEvent> currentArtEvents = [];
  void addArtEvent(ArtEvent newArtEvent) {
    currentArtEvents.add(newArtEvent);
  } 
}