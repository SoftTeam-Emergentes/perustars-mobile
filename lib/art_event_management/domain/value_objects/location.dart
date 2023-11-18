import 'package:equatable/equatable.dart';

class Location extends Equatable {

  const Location(this.city, this.country, this.latitude, this.longitude);
  
  final String city;
  final String country;
  final double? latitude;
  final double? longitude;
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}