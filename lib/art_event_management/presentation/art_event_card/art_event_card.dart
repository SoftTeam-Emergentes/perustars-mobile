import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';
import 'package:peru_stars_mobile/art_event_management/infrastructure/respositories/art_event_repository.dart';

class ArtEventCardWidget extends StatelessWidget {
  final ArtEvent artEvent;
  final int hobbystId;

  const ArtEventCardWidget(
    {Key? key, required this.artEvent, required this.hobbystId }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(artEvent.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("About: ${artEvent.description}"),
            const Divider(height: 5),
            Text("Start Date: ${artEvent.startDateTime.toLocal()}")
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            
          },
        ),
      ),
      shadowColor: Colors.amber
    );
  }
}