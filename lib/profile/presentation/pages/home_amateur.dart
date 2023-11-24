import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/art_event_management/application/art_event_facade_service.dart';
import 'package:peru_stars_mobile/art_event_management/infrastructure/models/art_event_model.dart';
import 'package:peru_stars_mobile/artwork/infrastructure/models/ArtworkModel.dart';
import 'package:peru_stars_mobile/ui/widgets/artist_card.dart';
import 'package:peru_stars_mobile/artwork/presentation/widgets/artwork_card.dart';
import 'package:peru_stars_mobile/profile/presentation/widgets/list_artist.dart';

import '../../../artwork/infrastructure/repositories/ArtworkRepository.dart';

class HomeAmateur extends StatefulWidget {
  const HomeAmateur({Key? key}) : super(key: key);

  @override
  State<HomeAmateur> createState() => _HomeAmateurState();
}

class _HomeAmateurState extends State<HomeAmateur> with TickerProviderStateMixin {
  late List<ArtworkModel> artworks;
  late List<ArtEventModel> artevents;
  late TabController _tabController;
  late Future<void> loadArtworksFuture;
  Future<void> loadArtworks() async {

    artworks = await ArtworkRepository().getArtworks();
    setState(() {});
  }
  @override
  void initState(){
    super.initState();
    _tabController=TabController(length: 2, vsync: this);
    loadArtworksFuture = loadArtworks();
  }
  @override
  Widget build(BuildContext context) {

    return FutureBuilder<void>(
      future: loadArtworksFuture,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if(snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        }
        return Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: ListView(children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              child: Text(
                "Your Artists",
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
                    text: "Works",
                  ),
                  Tab(
                    text: "Events",
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
                    children: artworks.map((a) {
                      return ArtworkCard(title: a.Title
                        ,subtitle: a.Description
                        ,price: a.Price.toString()
                        ,img:"https://enciclopedia.net/wp-content/uploads/2014/08/Obra-de-arte.jpg",);}).toList(),
                  ),
                  ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    children:artevents.map((ae) {return ArtworkCard(title: ae.title
                      ,subtitle: ae.description
                      ,price: '100',img:'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/a-chorus-line-elle-1603359467.jpg',);}).toList()

                    //[
                    //  ArtworkCard(title: "Todos vuelven!", subtitle: "Teatro centro de Lima", price: "55.90", img: "https://cdn.teleticket.com.pe/especiales/todos-vuelven-musical2022/images/pre006_rs.jpg",),
                    //  ArtworkCard(title: "Feria Caritas Felices", subtitle: "Av.Angamos 7145", price: "Gratis", img: "https://elcomercio.pe/resizer/7zqHHhzBNcnMRpdEtpjF0ThEij4=/580x330/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/SUWZY2KT2NAYJGKMM5ZNWT6JGQ.jpg",),
                    //  ArtworkCard(title: "Musicali", subtitle: "Jockey Plaza", price: "20.00", img: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/a-chorus-line-elle-1603359467.jpg",),
                    //  ArtworkCard(title: "Exposición Mediterraneo", subtitle: "Parque Kennedy", price: "Gratis", img: "https://www.artesaniairis.es/wp-content/uploads/2015/04/feria-artesanal-586x330.jpg",),
                    //  ArtworkCard(title: "JaviX en concierto", subtitle: "Estadio Nacional", price: "25.00", img: "https://static.euronews.com/articles/stories/05/60/03/82/1440x810_cmsv2_83506d1c-7936-5690-83d0-0329a2de1a2b-5600382.jpg",),
                    //  ArtworkCard(title: "La realeza", subtitle: "Teatro Marssano", price: "25.00", img: "https://picsum.photos/504",),
                    //]
                    ,
                  ),
                ],
              ),
            ),
          ]),
        );
      }
    );
  }
}
