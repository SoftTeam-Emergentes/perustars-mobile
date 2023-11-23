import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/models/ArtworkModel.dart';
import 'package:peru_stars_mobile/artwork/presentation/widgets/artwork_card.dart';
import 'package:peru_stars_mobile/ui/widgets/artist_card.dart';
import 'package:peru_stars_mobile/artwork/presentation/widgets/carousel.dart';

import '../../infrastructure/repositories/ArtworkRepository.dart';


class ArtworkPage extends StatefulWidget {
  final int? artistId;
  final String? title;
  final String? subtitle;
  final String? price;

  const ArtworkPage({Key? key, this.artistId, this.title, this.subtitle, this.price}) : super(key: key);

  @override
  _ArtworkPageState createState() => _ArtworkPageState();
}

class _ArtworkPageState extends State<ArtworkPage> {
  late List<ArtworkModel> artworks;

  @override
  void initState() {
    super.initState();
    loadArtworks();
  }

  Future<void> loadArtworks() async {
    // Utiliza tu repositorio para obtener los artworks del artista
    artworks = await ArtworkRepository().getArtworkByArtistId(widget.artistId ?? 0);

    // Actualiza el estado para reconstruir el widget con la lista dinámica
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          // ... (resto del código)

          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Más del artista", style: Theme.of(context).textTheme.headline4,),
                // Mapea la lista de artworks a ArtworkCard
                for (ArtworkModel artwork in artworks)
                  ArtworkCard(
                    title: artwork.Title,
                    subtitle: artwork.Description,
                    price: artwork.Price.toString(),
                    img: artwork.MainContent.Content,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
