
import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/models/artist.dart';

class SearchViewDelegate extends SearchDelegate<Artist> {
  final List<Artist> artists;
  List<Artist> _filter = [];

  SearchViewDelegate(this.artists);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){
            query = '';
          },
          icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, const Artist(''));
        },
        icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
        itemCount: _filter.length,
        itemBuilder: (_, index){
          return ListTile(
              title: Text(_filter[index].name)
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filter = artists.where((artist){
      return artist.name.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
        itemCount: _filter.length,
        itemBuilder: (_, index){
          return ListTile(
              title: Text(_filter[index].name)
          );
        }
    );
  }

}