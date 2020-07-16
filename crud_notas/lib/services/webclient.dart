import 'dart:convert';

import 'package:crud_notas/models/api_response.dart';
import 'package:crud_notas/models/ListaNotas.dart';
import 'package:crud_notas/models/nota.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {'apiKey': '4288f18d-7e85-4e51-8c31-42b9fcd970ff'};

  Future<APIResponse<List<ListaNotas>>> getNotesList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <ListaNotas>[];
        for (var item in jsonData) {
          notes.add(ListaNotas.fromJson(item));
        }
        return APIResponse<List<ListaNotas>>(data: notes);
      }
      return APIResponse<List<ListaNotas>>(
          error: true, errorMessage: 'Erro inesperado');
    }).catchError((context) => APIResponse<List<ListaNotas>>(
        error: true, errorMessage: 'Erro inesperado'));
  }

  Future<APIResponse<Nota>> getNota(String noteID) {
    return http.get(API + '/notes/' + noteID, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return APIResponse<Nota>(data: Nota.fromJson(jsonData));
      }
      return APIResponse<Nota>(error: true, errorMessage: 'Erro inesperado');
    }).catchError((context) =>
        APIResponse<Nota>(error: true, errorMessage: 'Erro inesperado'));
  }
}
