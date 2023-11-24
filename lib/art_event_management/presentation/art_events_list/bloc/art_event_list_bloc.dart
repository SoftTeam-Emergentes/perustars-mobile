import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peru_stars_mobile/art_event_management/application/art_event_facade_service.dart';
import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';
import 'package:peru_stars_mobile/art_event_management/presentation/services/art_event_shared_service.dart';
import 'package:peru_stars_mobile/common/helpers/get_it_helper.dart';
import './bloc.dart';

class ArtEventListBloc extends Bloc<ArtEventListEvent, ArtEventListState> {
  ArtEventListBloc({ required ArtEventFacadeService artEventFacadeService}) : super(InitialArtEventListState()) {
    on<FetchArtEventListEvent>(onFetchArtEventList);
    on<AddArtEventListEvent>(onUpdateArtEventList);
    _artEventFacadeService = artEventFacadeService;
    _artEventSharedService = getIt<ArtEventSharedService>();
  }

  late final ArtEventFacadeService _artEventFacadeService;
  late final ArtEventSharedService _artEventSharedService ;

  FutureOr<void> onFetchArtEventList(FetchArtEventListEvent event, Emitter<ArtEventListState> emitter) async {
    final List<ArtEvent> artEvents = await _artEventFacadeService.getAllArtEvents();
    print("Art events: $artEvents");
    _artEventSharedService.currentArtEvents = artEvents;
    emitter.call(ArtEventListLoadedState(artEvents));
  }

  FutureOr<void> onUpdateArtEventList(AddArtEventListEvent event, Emitter<ArtEventListState> emmiter) async {
    String response = await _artEventFacadeService.registerNewArtEvent(event.newArtEvent);
    _artEventSharedService.addArtEvent(event.newArtEvent);
   emmiter.call(ArtEventListUpdatedState(_artEventSharedService.currentArtEvents));
  }
  
}