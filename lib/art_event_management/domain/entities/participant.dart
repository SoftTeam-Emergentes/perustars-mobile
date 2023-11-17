import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Participant extends Equatable {

  Participant({
    this.id,
    required this.userName,
  }) {
    registerDateTime = DateTime.now();
  }

  final Long? id;
  final String userName;
  late final DateTime registerDateTime;
  DateTime? participantRegistrationDateTime;

  @override
  List<Object?> get props => throw UnimplementedError();

}