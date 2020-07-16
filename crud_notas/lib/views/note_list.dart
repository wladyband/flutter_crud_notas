import 'package:flutter/material.dart';

class NoteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Notas'),
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
    );
  }
}
