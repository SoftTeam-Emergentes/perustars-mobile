import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/ui/pages/artwork_page.dart';

class ArtworkCard extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? img;
  final String? price;

  const ArtworkCard({Key? key, this.title, this.subtitle, this.img, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      width: 300,
      height: 200,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Scaffold(body: ArtworkPage(title: this.title, subtitle: this.subtitle, price: this.price))));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: Colors.black26,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.network("${this.img==null?"https://picsum.photos/250":this.img}",
                  width: 300,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text("${this.title==null?"Título":this.title}", style: Theme.of(context).textTheme.headline3,),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                child: Row(
                  children: [
                    Text("${this.subtitle==null?"Sub título":this.subtitle}", style: Theme.of(context).textTheme.headline5,),
                    Spacer(flex: 1),
                    Icon(Icons.attach_money, size: 20, color: Colors.red[300],),
                    Text("${this.price==null?"100":this.price}", style: Theme.of(context).textTheme.headline4,),
                  ],
                ),
              )
            ],
          ),
        ),

      ),
    );
  }
}