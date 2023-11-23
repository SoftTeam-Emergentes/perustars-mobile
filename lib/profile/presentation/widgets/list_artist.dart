import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peru_stars_mobile/profile/infrastructure/models/artist_model.dart';

import '../../infrastructure/repositories/ArtistRepository.dart';

class CardItem {
  final String urlImage;
  final String name;

  const CardItem({
    required this.urlImage,
    required this.name,
  });
}

class ListArtist extends StatefulWidget {
  const ListArtist({Key? key}) : super(key: key);

  @override
  State<ListArtist> createState() => _ListArtistState();
}

class _ListArtistState extends State<ListArtist> {
  late List<CardItem> items;

  @override
  void initState() {
    super.initState();
    loadArtists();
  }

  Future<void> loadArtists() async {

    List<ArtistModel> artistas = await ArtistRepository().GetAllArtist();
    items = artistas.map((artistModel) {
      return CardItem(
        urlImage: 'https://cdn-icons-png.flaticon.com/512/3577/3577429.png',
        name: artistModel.brandName,
      );
    }).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (context, _) => SizedBox(width: 12),
        itemBuilder: (context, index) => buildCard(item: items[index]),
      ),
    );
  }

  Widget buildCard({
    required CardItem item,
  }) =>
      Container(
        width: 90,
        height: 100,
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.red,
              backgroundImage: NetworkImage(item.urlImage),
            ),
            Text(
              item.name,
              style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: Color(0XFFB7B7D2),
              ),
            ),
          ],
        ),
      );
}
