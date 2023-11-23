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

    if(widget.artistId!=null){
      artworks = await ArtworkRepository().getArtworkByArtistId(widget.artistId ?? 0);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(child: Carousel()),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widget.title==null?"Título":widget.title}", style: Theme.of(context).textTheme.headline3,),
              Text("${widget.subtitle==null?"Sub título":widget.subtitle}", style: Theme.of(context).textTheme.headline5,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
            child: Text(
              "Es una obra pictórica del polímata renacentista italiano Leonardo da Vinci. Fue adquirida por el rey Francisco I de Francia a comienzos del siglo XVI y desde entonces es propiedad del Estado francés.",
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.justify,
    ),
    ),
    Row(
    children: [
    Icon(Icons.attach_money, size: 30, color: Color(0XFF030047),),
    Text("${widget.price==null?"100":widget.price}", style: Theme.of(context).textTheme.headline3,),
    Spacer(flex: 1,),
    //Icon(Icons.favorite_border, size: 30, color: Colors.red,),
    IconButton(
    onPressed: (){},
    icon: Icon(Icons.favorite_border, size: 30, color: Colors.red,),
    )
    ],
    ),
    ],
    ),

    ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Más del artista", style: Theme.of(context).textTheme.headline4,),
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
