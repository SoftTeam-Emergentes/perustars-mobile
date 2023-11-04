import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/ui/widgets/artwork_card.dart';
import 'package:peru_stars_mobile/ui/widgets/artist_card.dart';
import 'package:peru_stars_mobile/ui/widgets/carousel.dart';


class ArtworkPage extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? price;

  const ArtworkPage({Key? key, this.title, this.subtitle, this.price}) : super(key: key);

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
                Text("${this.title==null?"Título":this.title}", style: Theme.of(context).textTheme.headline3,),
                Text("${this.subtitle==null?"Sub título":this.subtitle}", style: Theme.of(context).textTheme.headline5,),
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
                    Text("${this.price==null?"100":this.price}", style: Theme.of(context).textTheme.headline3,),
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
                ArtworkCard(title: "Claridad", subtitle: this.subtitle, price: "40.00", img: "https://picsum.photos/id/277/500",),
                ArtworkCard(title: "Un nuevo despertar", subtitle: this.subtitle, price: "29.90", img: "https://picsum.photos/id/104/500",),
                ArtworkCard(title: "Agua de manantial", subtitle: this.subtitle, price: "Gratis", img: "https://picsum.photos/id/384/500",),
              ],
            ),
          ),
         // Expanded, SizedBox, Container
        ],
      ),
    );
  }
}
