import 'package:equatable/equatable.dart';

class Notification extends Equatable {

  Notification({ 
    this.id, 
    required this.title,
    required this.description,
    required this.notificationSender,
    required this.artistId,
    required this.hobbyistId,
    DateTime? sentAt,
    this.isRead = false,
    this.collected = false
  }) {
    this.sentAt = sentAt ?? DateTime.now();
  }

  final BigInt? id;
  final String title;
  final String description;
  final BigInt artistId;
  final BigInt hobbyistId;
  final String notificationSender;
  late final DateTime sentAt;
  final bool isRead;
  final bool collected;

  @override
  List<Object?> get props => [id];

}