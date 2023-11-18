import 'package:equatable/equatable.dart';
import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';

abstract class ArtEventListEvent extends Equatable {
  const ArtEventListEvent();
}

class FetchArtEventListEvent extends ArtEventListEvent {

  @override
  List<Object?> get props => [];
}

class AddArtEventListEvent extends ArtEventListEvent {

  final ArtEvent newArtEvent;

  const AddArtEventListEvent(this.newArtEvent);

  @override
  List<Object?> get props => [];

}