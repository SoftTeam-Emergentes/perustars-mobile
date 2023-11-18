import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peru_stars_mobile/common/config/dependency_inyection.dart';
import 'bloc/bloc.dart';

class ArtEventsListWidget extends StatefulWidget {
  const ArtEventsListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArtEventListState();

}

class _ArtEventListState extends State<ArtEventsListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArtEventListBloc>(
      create: (BuildContext context) => 
      DependencyInjectionProvider.instance().injectInstance<ArtEventListBloc>()..add(FetchArtEventListEvent()),
      child: BlocBuilder<ArtEventListBloc, ArtEventListState>(
        builder: (BuildContext context, ArtEventListState state) {
          if(state is ArtEventListLoadedState) {
            return const Text("GAAAA");
          }
          return const Text("No bloc widget found");
        }
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: const Text("Art Events"), automaticallyImplyLeading: false),
      
    // );
  }

}