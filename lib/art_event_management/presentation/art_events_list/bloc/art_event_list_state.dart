import 'package:equatable/equatable.dart';
import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';

abstract class ArtEventListState extends Equatable {
  const ArtEventListState();
}

class InitialArtEventListState extends ArtEventListState {
  @override
  List<Object?> get props => [];
}

class ArtEventListLoadedState extends ArtEventListState {
  final List<ArtEvent> artEvents;

  const ArtEventListLoadedState(this.artEvents);

  @override
  List<Object?> get props => [artEvents];

  @override
  String toString() {
    return "ArtEvenListLoadedState total: ${artEvents.length}";
  }
}
class ArtEventListUpdatedState extends ArtEventListState {
  final List<ArtEvent> artEvents;

  const ArtEventListUpdatedState(this.artEvents);

  @override
  List<Object?> get props => [artEvents];

}