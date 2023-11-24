import 'package:peru_stars_mobile/art_event_management/domain/entities/participant.dart';
import 'dart:ffi';

import 'package:peru_stars_mobile/art_event_management/domain/interfaces/participant_interface.dart';
import 'package:peru_stars_mobile/art_event_management/infrastructure/models/participant_model.dart';

class ParticipantRepository implements ParticipantInterface {
  @override
  Future<String> deleteParticipantById(BigInt participantId) {
    // TODO: implement deleteParticipantById
    throw UnimplementedError();
  }

  @override
  Future<List<Participant>> getAllParticipants() {
    
    // TODO: implement getAllParticipants
    throw UnimplementedError();
  }

  @override
  Future<List<Participant>> getParticipantsByArtistId() {
    // TODO: implement getParticipantsByArtistId
    throw UnimplementedError();
  }

  @override
  Future<Participant> registerParticipation(Participant participant) async {
    return Participant(userName: "", hobbystId: BigInt.from(1), artEventId: BigInt.from(1));
  }
  
}