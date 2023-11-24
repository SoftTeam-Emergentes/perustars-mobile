import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';
import 'package:peru_stars_mobile/art_event_management/presentation/widgets/art_event_card.dart';
import 'package:peru_stars_mobile/art_event_management/presentation/widgets/artists/art_event_form.dart';
import 'package:peru_stars_mobile/common/helpers/get_it_helper.dart';

import '../bloc/bloc.dart';

class ArtistArtEventListScreen extends StatelessWidget {
  ArtistArtEventListScreen({Key? key}) : super(key: key);

  final ArtEventListBloc _artEventListBloc = getIt<ArtEventListBloc>();

  List<ArtEvent> _currentArtEvents = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Art Events"), automaticallyImplyLeading: false),
      body: BlocProvider<ArtEventListBloc>(
        create: (BuildContext context) {
          _artEventListBloc.add(FetchArtEventListEvent());
          return _artEventListBloc;
        },
        child: BlocBuilder<ArtEventListBloc, ArtEventListState>(
          builder: (BuildContext context, ArtEventListState state) {
            if(state is ArtEventListLoadedState) {
              _currentArtEvents = state.artEvents;
              return ListView.builder(
                itemCount: state.artEvents.length,
                itemBuilder: (BuildContext context, int index) {
                  return ArtEventCardWidget(artEvent: state.artEvents[index]);
                }
              );
            }
            return const Text("No bloc widget found");
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const ArtEventForm()
          );
        }
      ),
    );
  }

}