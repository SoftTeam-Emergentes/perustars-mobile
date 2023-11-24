import 'dart:io';

import '../utils/http_status.dart';

class ServerException extends HttpException {
  final HttpStatus status;
  final Map<String, dynamic>? additionalInfo;

  ServerException(String message, this.status, {this.additionalInfo}) : super(message);

}