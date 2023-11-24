import 'package:peru_stars_mobile/art_event_management/domain/value_objects/location.dart';

class LocationModel extends Location {
  const LocationModel(
    String city,
    String country,
    double? latitude,
    double? longitude
  ) : super(city, country, latitude, longitude);

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      json["city"],
      json["country"],
      json["latitude"],
      json["longitude"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "city": city,
      "country": country,
      "latitude": latitude,
      "longitude": longitude
    };
  }
  
}