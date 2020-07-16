
import 'package:crud_notas/models/note.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {

  final notes = [
    new Note(
        noteID: "1",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 1"
    ),
    new Note(
        noteID: "2",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 2"
    ),
    new Note(
        noteID: "3",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 3"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Notas'),
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: ListView.separated(
        // Poderia ser feito dessa forma ==>  separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Colors.green),
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 1,
            color: Colors.green,
          );
        },
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index].noteTitle,
            style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            subtitle: Text('20/02/2020'),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
