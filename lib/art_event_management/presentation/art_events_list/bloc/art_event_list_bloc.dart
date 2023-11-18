import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peru_stars_mobile/art_event_management/application/art_event_facade_service.dart';
import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';
import './bloc.dart';

class ArtEventListBloc extends Bloc<ArtEventListEvent, ArtEventListState> {
  ArtEventListBloc({ required ArtEventFacadeService artEventFacadeService}) : super(InitialArtEventListState()) {
    on<FetchArtEventListEvent>(onFetchArtEventList);
    _artEventFacadeService = artEventFacadeService;
  }

  late final ArtEventFacadeService _artEventFacadeService;

  void onFetchArtEventList(FetchArtEventListEvent event, Emitter<ArtEventListState> emitter) async {
    final List<ArtEvent> artEvents = await _artEventFacadeService.getAllArtEvents();
    emitter.call(ArtEvenListLoadedState(artEvents));
  }
  
}