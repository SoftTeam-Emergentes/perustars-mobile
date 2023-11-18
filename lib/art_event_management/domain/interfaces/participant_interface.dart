import 'dart:ffi';

import 'package:peru_stars_mobile/art_event_management/domain/entities/participant.dart';

abstract class ParticipantInterface {
  Future<List<Participant>> getParticipantsByArtistId();
  Future<List<Participant>> getAllParticipants();
  Future<String> deleteParticipantById(Long participantId);
  Future<Participant> registerParticipation(Participant participant);
}