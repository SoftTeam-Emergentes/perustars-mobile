import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';
import 'package:peru_stars_mobile/art_event_management/presentation/art_event_card/art_event_card.dart';
import 'package:peru_stars_mobile/ui/widgets/NavBar.dart';
import 'bloc/bloc.dart';

class ArtEventsListWidget extends StatefulWidget {
  const ArtEventsListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArtEventListState();

}

class _ArtEventListState extends State<ArtEventsListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Art Events"), automaticallyImplyLeading: false),
      
    );
  }

}