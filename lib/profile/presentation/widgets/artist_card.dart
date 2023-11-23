import 'package:flutter/material.dart';

class ArtistCard extends StatelessWidget {
  final String? name;
  final String? img;
  final String? type;

  const ArtistCard({Key? key, this.name, this.img, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 300,
          height: 100,
          margin: EdgeInsets.fromLTRB(22, 0, 15, 0),
          child: Row(            
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network("${this.img==null?"https://picsum.photos/200":this.img}",
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${this.name==null?"Shakira":this.name}", style: Theme.of(context).textTheme.headline3,),
                    Text("${this.type==null?"Música":this.type}", style: Theme.of(context).textTheme.bodyText2,),
                  ],
                ),
              ),
              Spacer(flex: 1,),
              Container(
                height: 60,
                width: 12,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}