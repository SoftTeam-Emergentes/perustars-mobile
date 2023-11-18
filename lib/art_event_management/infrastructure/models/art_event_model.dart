import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';
import 'package:peru_stars_mobile/art_event_management/domain/enums/art_event_status.dart';

import '../../domain/value_objects/location.dart';

class ArtEventModel extends ArtEvent {
  const ArtEventModel(
    BigInt? id,
    String title,
    String description,
    DateTime startDateTime,
    bool isOnline,
    BigInt artistId,
    ArtEventStatus artEventStatus,
    bool collected,
    Location? location
  ) : super(id: id, title: title, 
      description: description, startDateTime: startDateTime,
      isOnline: isOnline, artistId: artistId,
      artEventStatus: artEventStatus, collected: collected, location: location);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "startDateTime": startDateTime,
      "isOnline": isOnline,
      "artistId": artistId.toInt(),
      "artEventStatus": artEventStatus,
      "collected": collected,
      "location": location
    };
  }
}