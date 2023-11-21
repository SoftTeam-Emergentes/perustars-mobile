import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peru_stars_mobile/art_event_management/domain/entities/art_event.dart';
import 'package:peru_stars_mobile/art_event_management/presentation/art_events_list/bloc/art_event_list_bloc.dart';
import 'package:peru_stars_mobile/art_event_management/presentation/art_events_list/bloc/art_event_list_event.dart';
import 'package:peru_stars_mobile/art_event_management/presentation/services/art_event_shared_service.dart';
import 'package:peru_stars_mobile/common/config/dependency_inyection.dart';
import 'package:peru_stars_mobile/common/config/mini-storage.dart' as miniStorage;

class ArtEventForm extends StatefulWidget {
  const ArtEventForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ArtEventFormState();
}

class _ArtEventFormState extends State<ArtEventForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool? _isOnline = false;

  final ArtEventListBloc _artEventListBloc = DependencyInjectionProvider.instance().injectInstance<ArtEventListBloc>();
  final BigInt _artistId = miniStorage.read("artistId") as BigInt;

  final ArtEventSharedService currentArtEvents = DependencyInjectionProvider.instance().injectInstance<ArtEventSharedService>();

  _ArtEventFormState();

  bool _inputIsValid() {
    return _titleController.text.isNotEmpty && 
    _descriptionController.text.isNotEmpty && _isOnline != null;
  }
  void _showInvalidInputDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("Some values are missing. Check and try again."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Ok")
            )
          ],
        );
      }
    );
  }
  void _publishAddArtEventEvent() {
    _artEventListBloc.add(AddArtEventListEvent(
      ArtEvent(
        title: _titleController.value.text,
        description: _descriptionController.value.text,
        artistId: _artistId,
        startDateTime: DateTime.now()
      )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text("Add New Event", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16.0),
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: "Title"
          ),
          style: GoogleFonts.montserrat(
            fontSize: 15.0,
            fontWeight: FontWeight.w400
          ),
        ),
        const SizedBox(height: 8.0),
        TextField(
          controller: _descriptionController,
          decoration: const InputDecoration(
            labelText: "Description"
          ),
          style: GoogleFonts.montserrat(
            fontSize: 15.0,
            fontWeight: FontWeight.w400
          ),
        ),
        const SizedBox(height: 8.0),
        DropdownButton<bool>(
          items: const <DropdownMenuItem<bool>> [
            DropdownMenuItem<bool>(value: true, child: Text("Live")),
            DropdownMenuItem<bool>(value: true, child: Text("Online"))
          ],
          onChanged: (bool? newValue) => setState(() => _isOnline = newValue as bool)
        ),
        const SizedBox(height: 26.0),
        ElevatedButton(
          onPressed: () {
            if(_inputIsValid() == false) {
              _showInvalidInputDialog();
              return;
            }
            _publishAddArtEventEvent();
          },
          child: const Text("Save")
        )
      ],
    );
  }
}