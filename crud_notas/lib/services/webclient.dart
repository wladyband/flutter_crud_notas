import 'dart:convert';

import 'package:crud_notas/models/api_response.dart';
import 'package:crud_notas/models/ListaNotas.dart';
import 'package:crud_notas/models/inserir_nota.dart';
import 'package:crud_notas/models/nota.dart';
import 'package:http/http.dart' as http;

class NotasService {
  static const API = 'http://api.notes.programmingaddict.com';
  static const headers = {
    'apiKey': '03156861-bb03-48eb-92cc-99b38297aa37',
    'Content-Type': 'application/json'
  };

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

  Future<APIResponse<bool>> createNote(NotaInsert item) {
    return http
        .post(API + '/notes',
            headers: headers, body: json.encode(item.toJson()))
        .then((data) {
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'Erro inesperado');
    }).catchError((_) =>
            APIResponse<bool>(error: true, errorMessage: 'Erro inesperado'));
  }
}
