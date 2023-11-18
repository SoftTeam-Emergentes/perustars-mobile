import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';

class ArtEventFacadeService {
  Future<List<ArtEvent>> getAllArtEvents() async {
    return [ArtEvent(title: "Sample", description: "Sample", startDateTime: DateTime(2023, 11, 18), artistId: BigInt.one)];
  }
}