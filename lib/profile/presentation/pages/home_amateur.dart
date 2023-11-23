import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/ui/widgets/artist_card.dart';
import 'package:peru_stars_mobile/ui/widgets/artwork_card.dart';
import 'package:peru_stars_mobile/ui/widgets/list_artist.dart';

class HomeAmateur extends StatefulWidget {
  const HomeAmateur({Key? key}) : super(key: key);

  @override
  State<HomeAmateur> createState() => _HomeAmateurState();
}

class _HomeAmateurState extends State<HomeAmateur>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Text(
            "Tus Artistas",
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListArtist(),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: "Obras",
              ),
              Tab(
                text: "Eventos",
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 1, horizontal: 30),
          height: 450,
          child: TabBarView(
            controller: _tabController,
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                children: [
                  ArtworkCard(title: "El Matrimonio de la Ñusta", subtitle: "Museo Pedro de Osma", price: "450", img: "https://www.peru.travel/Contenido/Uploads/matrimonio-%C3%B1usta_637701795439068500.jpg",),
                  ArtworkCard(title: "Rayos del Sol", subtitle: "Javier Tebas", price: "120", img: "https://artelista.s3.amazonaws.com/obras/big/3/2/9/7335142356785984.jpg",),
                  ArtworkCard(title: "Epopeya Nacional", subtitle: "Diana Valle", price: "55.90", img: "https://aion.mx/wp-content/uploads/2022/03/Gilgamesh.jpg",),
                  ArtworkCard(title: "Doña Manuela Tupa Amaro", subtitle: "MALI", price: "900", img: "https://picsum.photos/315",),
                  ArtworkCard(title: "Cuando Pienses el volver", subtitle: "Pedro S. Vertiz", price: "4.99", img: "https://i.blogs.es/c7ba83/rock-band/1366_2000.jpg",),
                  ArtworkCard(title: "La noche estrellada", subtitle: "Van Goh", price: "1200", img: "https://cloudfront-us-east-1.images.arcpublishing.com/culturacolectiva/KUFCDXCONRDCHFF5Z4XVP6DZKM.jpg",),
                ],
              ),
              ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                children: [
                  ArtworkCard(title: "Todos vuelven!", subtitle: "Teatro centro de Lima", price: "55.90", img: "https://cdn.teleticket.com.pe/especiales/todos-vuelven-musical2022/images/pre006_rs.jpg",),
                  ArtworkCard(title: "Feria Caritas Felices", subtitle: "Av.Angamos 7145", price: "Gratis", img: "https://elcomercio.pe/resizer/7zqHHhzBNcnMRpdEtpjF0ThEij4=/580x330/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/SUWZY2KT2NAYJGKMM5ZNWT6JGQ.jpg",),
                  ArtworkCard(title: "Musicali", subtitle: "Jockey Plaza", price: "20.00", img: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/a-chorus-line-elle-1603359467.jpg",),
                  ArtworkCard(title: "Exposición Mediterraneo", subtitle: "Parque Kennedy", price: "Gratis", img: "https://www.artesaniairis.es/wp-content/uploads/2015/04/feria-artesanal-586x330.jpg",),
                  ArtworkCard(title: "JaviX en concierto", subtitle: "Estadio Nacional", price: "25.00", img: "https://static.euronews.com/articles/stories/05/60/03/82/1440x810_cmsv2_83506d1c-7936-5690-83d0-0329a2de1a2b-5600382.jpg",),
                  ArtworkCard(title: "La realeza", subtitle: "Teatro Marssano", price: "25.00", img: "https://picsum.photos/504",),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
