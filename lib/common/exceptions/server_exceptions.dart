import 'dart:io';

import 'package:equatable/equatable.dart';

class ServerException extends Equatable{
  final String message;
  final HttpStatus status;
  final Map<String, dynamic>? additionalInfo;

  const ServerException(this.message, this.status, {this.additionalInfo});

  @override
  List<Object?> get props => [message, status, additionalInfo];

}