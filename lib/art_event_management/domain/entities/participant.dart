import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Participant extends Equatable {

  Participant({
    this.id,
    required this.userName,
    required this.hobbystId,
    required this.artEventId,
    this.registerDateTime
  }) {
    registerDateTime = registerDateTime ?? DateTime.now();
  }

  final BigInt? id;
  final String userName;
  final BigInt hobbystId;
  final BigInt artEventId;
  late final DateTime? registerDateTime;
  DateTime? participantRegistrationDateTime;

  @override
  List<Object?> get props => throw UnimplementedError();

}