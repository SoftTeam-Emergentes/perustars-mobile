import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/models/artist.dart';
import 'package:peru_stars_mobile/ui/pages/search_view_delegate.dart';
import 'package:peru_stars_mobile/ui/widgets/artwork_card.dart';
import 'package:peru_stars_mobile/ui/widgets/artist_card.dart';

class Data {
  String name;
  String type;
  String img;
  Data({this.name="", this.type="", this.img=""});
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  List items = [
    Data(name: "HI", img: "", type: "")
  ];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final List<Artist> artists = [
      new Artist('Shakira'),
      new Artist('Picasso'),
      new Artist('Eva Ayllon'),
      new Artist('Van Goh'),
      new Artist('Gian Marco'),
      new Artist('Hugo Javier'),
      new Artist('Sebastiao Salgado'),
    ];
    return Container(
      margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: ListTile(
              title: Text('Search', style: Theme.of(context).textTheme.bodyText2,),
              onTap: (){
                showSearch(
                  context: context,
                  delegate: SearchViewDelegate(artists),
                );
              },
            ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Color(0XFFB7B7D2),
                    semanticLabel: 'Text to announce in accessibility modes',
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "Artistas",
                ),
                Tab(
                  text: "Obras",
                ),
                Tab(
                  text: "Eventos",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 410,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView(
                  children: [
                    ArtistCard(name: "GeorgeS", type: "Músico", img: "https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",),
                    ArtistCard(name: "Alonso Barrantes", type: "Fotógrafo", img: "https://media.istockphoto.com/photos/portrait-of-a-young-african-man-at-studio-high-fashion-male-model-in-picture-id1325359218?b=1&k=20&m=1325359218&s=170667a&w=0&h=MflA10Erq46yR-LFSREN6svtgXP7OeKuiBGXkYnBWls=",),
                    ArtistCard(name: "Sebastián Abad", type: "Pintor", img: "https://images.pexels.com/photos/428364/pexels-photo-428364.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",),
                    ArtistCard(name: "Diana Valle", type: "Actriz", img: "https://images.pexels.com/photos/3586798/pexels-photo-3586798.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",),
                    ArtistCard(name: "Pedros S. Vertiz", type: "Músico", img: "https://yt3.ggpht.com/ytc/AKedOLRhF5Mixhp7kaG4jc7X7p6oJDL5LJg2UHD1x9_A=s900-c-k-c0x00ffffff-no-rj",),
                    ArtistCard(name: "Gustavo Chang", type: "Escultor", img: "https://images.pexels.com/photos/3612409/pexels-photo-3612409.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",),
                   ],
                ),
                ListView(
                  children: [
                    ArtworkCard(title: "La noche estrellada", subtitle: "Van Goh", price: "1200", img: "https://cloudfront-us-east-1.images.arcpublishing.com/culturacolectiva/KUFCDXCONRDCHFF5Z4XVP6DZKM.jpg",),
                    ArtworkCard(title: "Cuando Pienses el volver", subtitle: "Pedro S. Vertiz", price: "4.99", img: "https://i.blogs.es/c7ba83/rock-band/1366_2000.jpg",),
                    ArtworkCard(title: "Doña Manuela Tupa Amaro", subtitle: "MALI", price: "900", img: "https://picsum.photos/315",),
                    ArtworkCard(title: "El Matrimonio de la Ñusta", subtitle: "Museo Pedro de Osma", price: "450", img: "https://www.peru.travel/Contenido/Uploads/matrimonio-%C3%B1usta_637701795439068500.jpg",),
                    ArtworkCard(title: "Rayos del Sol", subtitle: "Javier Tebas", price: "120", img: "https://artelista.s3.amazonaws.com/obras/big/3/2/9/7335142356785984.jpg",),
                    ArtworkCard(title: "Epopeya Nacional", subtitle: "Diana Valle", price: "55.90", img: "https://aion.mx/wp-content/uploads/2022/03/Gilgamesh.jpg",),
                  ],
                ),
                ListView(
                  children: [
                    ArtworkCard(title: "JaviX en concierto", subtitle: "Estadio Nacional", price: "25.00", img: "https://static.euronews.com/articles/stories/05/60/03/82/1440x810_cmsv2_83506d1c-7936-5690-83d0-0329a2de1a2b-5600382.jpg",),
                    ArtworkCard(title: "Feria Caritas Felices", subtitle: "Av.Angamos 7145", price: "Gratis", img: "https://elcomercio.pe/resizer/7zqHHhzBNcnMRpdEtpjF0ThEij4=/580x330/smart/filters:format(jpeg):quality(75)/arc-anglerfish-arc2-prod-elcomercio.s3.amazonaws.com/public/SUWZY2KT2NAYJGKMM5ZNWT6JGQ.jpg",),
                    ArtworkCard(title: "Musicali", subtitle: "Jockey Plaza", price: "20.00", img: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/a-chorus-line-elle-1603359467.jpg",),
                    ArtworkCard(title: "Exposición Mediterraneo", subtitle: "Parque Kennedy", price: "Gratis", img: "https://www.artesaniairis.es/wp-content/uploads/2015/04/feria-artesanal-586x330.jpg",),
                    ArtworkCard(title: "Todos vuelven!", subtitle: "Teatro centro de Lima", price: "55.90", img: "https://cdn.teleticket.com.pe/especiales/todos-vuelven-musical2022/images/pre006_rs.jpg",),
                    ArtworkCard(title: "La realeza", subtitle: "Teatro Marssano", price: "25.00", img: "https://picsum.photos/504",),
                  ],
                ),
              ],
            ),
          ),
          // Expanded, SizedBox, Container
        ],
      ),
    );
  }
}
