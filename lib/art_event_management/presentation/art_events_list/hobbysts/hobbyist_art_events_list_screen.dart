import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peru_stars_mobile/art_event_management/presentation/widgets/art_event_card.dart';
import 'package:peru_stars_mobile/common/helpers/get_it_helper.dart';
import '../bloc/bloc.dart';

class HobbyistArtEventListScreen extends StatelessWidget {
  HobbyistArtEventListScreen({Key? key}) : super(key: key) {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Art Events"), automaticallyImplyLeading: false),
      body: BlocProvider<ArtEventListBloc>(
        create: (context) => getIt<ArtEventListBloc>()..add(FetchArtEventListEvent()),
        child: BlocBuilder<ArtEventListBloc, ArtEventListState>(
          builder: (BuildContext context, ArtEventListState state) {
            if(state is ArtEventListLoadedState) {
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
      )
    );
  }

}