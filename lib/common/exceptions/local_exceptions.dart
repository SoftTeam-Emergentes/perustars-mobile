import 'package:equatable/equatable.dart';

class LocalException extends Equatable {
  final String message;
  final Map<String, dynamic>? additionalInfo;

  const LocalException(this.message, {this.additionalInfo});

  @override
  List<Object> get props => [message, additionalInfo.toString()];

}