import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';

class ArtEventCardWidget extends StatelessWidget {
  final ArtEvent artEvent;
  const ArtEventCardWidget({Key? key, required this.artEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(artEvent.title),
        subtitle: Text(artEvent.description),
      ),
    );
  }

}