import 'package:crud_notas/models/note.dart';
import 'package:crud_notas/views/note_delete.dart';
import 'package:crud_notas/views/note_modify.dart';
import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  final notes = [
    new Note(
        noteID: "1",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 1"),
    new Note(
        noteID: "2",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 2"),
    new Note(
        noteID: "3",
        createDateTime: DateTime.now(),
        latestEditDateTime: DateTime.now(),
        noteTitle: "Note 3"),
  ];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Notas'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => NoteModify()));
              })
        ],
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
          return Dismissible(
            key: ValueKey(notes[index].noteID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) async {
              final result = await showDialog(
                  context: context, builder: (context) => NoteDelete());
              print(result);
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(
                child: Icon(Icons.delete, color: Colors.white),
                alignment: Alignment.centerLeft,
              ),
            ),
            child: ListTile(
              title: Text(
                notes[index].noteTitle,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text(
                  'Últimas alterações foram em ${formatDateTime(notes[index].latestEditDateTime)}'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => NoteModify(noteID: notes[index].noteID)));
              },
            ),
          );
        },
        itemCount: notes.length,
      ),
    );
  }
}
