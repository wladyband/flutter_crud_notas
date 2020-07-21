import 'package:flutter/foundation.dart';

class NotaModificada {
  String noteTitle;
  String noteContent;

  NotaModificada(
      {
        @required this.noteTitle,
        @required this.noteContent,
      }
      );

  Map<String, dynamic> toJson() {
    return {
      "noteTitle": noteTitle,
      "noteContent": noteContent
    };
  }
}