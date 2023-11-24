import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';
import 'package:peru_stars_mobile/art_event_management/domain/enums/art_event_status.dart';
import 'package:peru_stars_mobile/art_event_management/infrastructure/models/location_model.dart';

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
  
  factory ArtEventModel.fromJson(Map<String, dynamic> json) {
    return ArtEventModel(null, json["title"], json["description"], 
    DateTime.parse(json["startDateTime"] as String), json["isOnline"],
    BigInt.from(json["artistId"]), ArtEventModel.intToArtEventStatus(json["currentStatus"]), json["collected"], LocationModel.fromJson(json["location"]));
  }

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
  static ArtEventStatus intToArtEventStatus(int value) {
    switch(value) {
      case 0:
        return ArtEventStatus.registered;
      case 1:
        return ArtEventStatus.cancelled;
      default:
        return ArtEventStatus.registered;
    }

  }
}