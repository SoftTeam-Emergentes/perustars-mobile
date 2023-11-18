import 'package:equatable/equatable.dart';
import 'package:peru_stars_mobile/art_event_management/domain/enums/art_event_status.dart';

import '../value_objects/location.dart';

class ArtEvent extends Equatable {
  const ArtEvent({
    this.id,
    required this.title,
    required this.description,
    required this.startDateTime,
    this.isOnline = false,
    required this.artistId,
    this.location,
    this.artEventStatus = ArtEventStatus.registered,
    this.collected = false
  });

  final BigInt? id;
  final String title;
  final String description;
  final DateTime startDateTime;
  final bool isOnline;
  final BigInt artistId;
  final Location? location;
  final ArtEventStatus? artEventStatus;
  final bool? collected;

  @override
  List<Object?> get props => [id, title, description, startDateTime, isOnline, artistId];

  factory ArtEvent.createInstance(
    String title,
    String description,
    DateTime startDateTime,
    BigInt artistId
  ) {
    return ArtEvent(title: title, description: description, startDateTime: startDateTime, artistId: artistId);
  }

}