import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';
import 'package:peru_stars_mobile/art_event_management/domain/interfaces/art_event_interface.dart';

class ArtEventFacadeService {
  ArtEventFacadeService({ required ArtEventInterface artEventInterface }) {
    _artEventInterface = artEventInterface;
  }

  late final ArtEventInterface _artEventInterface;

  Future<List<ArtEvent>> getAllArtEvents() async {
    return _artEventInterface.getAllEvents();
  }

  Future<String> registerNewArtEvent(ArtEvent artEvent) async {
    return await _artEventInterface.addNewArtEvent(artEvent);
  }
}