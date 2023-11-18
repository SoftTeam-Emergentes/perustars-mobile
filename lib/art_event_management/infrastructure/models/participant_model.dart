import 'package:peru_stars_mobile/art_event_management/domain/entities/participant.dart';

class ParticipantModel extends Participant {
  ParticipantModel({
    BigInt? id,
    required String userName,
    required BigInt hobbystId,
    required BigInt artEventId,
    DateTime? registerDateTime,
  }) : super(id: id, 
      userName: userName,
      hobbystId: hobbystId,
      artEventId: artEventId,
      registerDateTime: registerDateTime);

  factory ParticipantModel.fromJson(Map<String, dynamic> json) {
    return ParticipantModel(
      id: json["id"],
      userName: json["userName"],
      registerDateTime: json["registerDateTime"],
      hobbystId: json["hobbystId"],
      artEventId: json["artistId"]
    );
  }

  factory ParticipantModel.createInstance(
    BigInt? id,
    String userName,
    BigInt hobbyistId,
    BigInt artEventId,
    DateTime? registerDateTime
  ) {
    return ParticipantModel(id: id, userName: userName, hobbystId: hobbyistId, artEventId: artEventId, registerDateTime: registerDateTime);
  }

  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "registerDateTime": registerDateTime,
      "hobbystId": hobbystId,
      "artEventId": artEventId
    };
  }
  
}