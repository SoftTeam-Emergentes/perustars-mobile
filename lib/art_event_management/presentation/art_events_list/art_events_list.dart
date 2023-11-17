import 'package:flutter/material.dart';
import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';
import 'package:peru_stars_mobile/ui/widgets/NavBar.dart';

class ArtEventsListWidget extends StatefulWidget {
  const ArtEventsListWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArtEventListState();

}

class _ArtEventListState extends State<ArtEventsListWidget> {

  List<ArtEvent> artEvents = [];
  List<String> test = ["One", "Two", "Three"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void addArtEvent() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Art Events"), automaticallyImplyLeading: false),
      body: ListView.builder(
        itemCount: test.length,
        itemBuilder:(context, index) {
          return Card(
            child: ListTile(
              title: Text(test[index]),
            ),
          );
        }
      ),
    );
  }

}