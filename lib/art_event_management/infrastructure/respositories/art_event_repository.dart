import 'dart:collection';
import 'dart:developer';
import 'dart:io';

import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';
import 'dart:ffi';

import 'package:peru_stars_mobile/art_event_management/domain/interfaces/art_event_interface.dart';
import 'package:peru_stars_mobile/art_event_management/infrastructure/data_sources/art_events_remote_data_provider.dart';
import 'package:peru_stars_mobile/art_event_management/infrastructure/models/art_event_model.dart';
import 'package:peru_stars_mobile/common/exceptions/exceptions.dart';
import 'package:peru_stars_mobile/common/utils/http_status.dart';

class ArtEventRepository implements ArtEventInterface {

  ArtEventRepository() {
    _artEventRemoteProvider = ArtEventRemoteProvider();
  }

  late final ArtEventRemoteProvider _artEventRemoteProvider;

  @override
  Future<String> cancelArtEvent(Long artEventId) async {
    try {
      String response = await _artEventRemoteProvider.cancelArtEvent(artEventId);
      return response;
    } catch(e) {
      log("XD");
      throw Exception("Something went wrong");
    }
  }

  @override
  Future<String> editArtEvent(Long artEventId) {
    // TODO: implement editArtEvent
    throw UnimplementedError();
  }

  @override
  Future<List<ArtEvent>> getAllEvents() async {
    try {
      List<ArtEvent> artEvents = await _artEventRemoteProvider.getAllArtEvents();
      return artEvents;
    } catch(e) {
      log("XD");
      throw Exception("Something went wrong");
    }
  }

  @override
  Future<List<ArtEvent>> getArtEventsByArtistId(Long artistId) {
    // TODO: implement getArtEventsByArtistId
    throw UnimplementedError();
  }

  @override
  Future<List<ArtEvent>> getArtEventsByHobbyistId(Long hobbyistId) {
    // TODO: implement getArtEventsByHobbyistId
    throw UnimplementedError();
  }

  @override
  Future<String> startArtEvent(Long artEventId) {
    // TODO: implement startArtEvent
    throw UnimplementedError();
  }
  
  @override
  Future<String> addNewArtEvent(ArtEvent artEvent) async {
    try {
      String response = await _artEventRemoteProvider.registerNewArtEvent(artEvent as ArtEventModel);
      return response;
    } catch(e) {
      log(e.toString());
      throw ServerException("Something went wrong when registering a new art event", HttpStatus.fromStatusCode(500));
    }
  }
  
}