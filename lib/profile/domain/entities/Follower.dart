import 'package:equatable/equatable.dart';

class Follower extends Equatable{
  final int artistId;
  final int hobbyistId;

  Follower({required this.artistId, required this.hobbyistId});

  @override

  List<Object?> get props => [artistId,hobbyistId];

}