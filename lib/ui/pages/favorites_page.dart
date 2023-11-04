import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/ui/widgets/artwork_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final artworks = 6;

    if(artworks==0){
      return ListView(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
        children: [
          Text("Tus favoritos", style: Theme.of(context).textTheme.headline3,),
          Center(
            heightFactor: 25,
            child: Text("No cuentas con obras favoritas"),
          )
        ],
      );
    }

    return ListView(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 0),
      children: [
        Text("Tus favoritos", style: Theme.of(context).textTheme.headline3,),
        Column(
          children: [
            ArtworkCard(title: "Odisea", subtitle: "George Hernández", price: "Gratis", img: "https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ArtworkCard(title: "Rayos del Sol", subtitle: "Javier Tebas", price: "120", img: "https://artelista.s3.amazonaws.com/obras/big/3/2/9/7335142356785984.jpg",),
            ArtworkCard(title: "Nublado", subtitle: "George Hernández", price: "4.99", img: "https://services.meteored.com/img/article/las-bondades-de-las-nieblas-234221-2_1024.jpg",),
            ArtworkCard(title: "Mi Ritmo", subtitle: "George Hernández", price: "3.00", img: "https://images.unsplash.com/photo-1519892300165-cb5542fb47c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",),
            ArtworkCard(title: "Epopeya Nacional", subtitle: "Diana Valle", price: "55.90", img: "https://aion.mx/wp-content/uploads/2022/03/Gilgamesh.jpg",),
          ],
        )
      ],
    );
  }
}