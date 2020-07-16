import 'dart:convert';

import 'package:crud_notas/models/api_response.dart';
import 'package:crud_notas/models/note.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {'apiKey': '4288f18d-7e85-4e51-8c31-42b9fcd970ff'};

  Future<APIResponse<List<Note>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <Note>[];
        for (var item in jsonData) {
          final note = Note(
            noteID: item['noteID'],
            noteTitle: item['noteTitle'],
            createDateTime: DateTime.parse(item['createDateTime']),
            latestEditDateTime: item['latestEditDateTime'] != null
                ? DateTime.parse(item['latestEditDateTime'])
                : null,
          );
          notes.add(note);
        }
        return APIResponse<List<Note>>(data: notes);
      }
      return APIResponse<List<Note>>(
          error: true, errorMessage: 'Erro inesperado');
    }).catchError((_) =>
        APIResponse<List<Note>>(error: true, errorMessage: 'Erro inesperado'));
  }
}
