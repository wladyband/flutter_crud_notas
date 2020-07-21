import 'package:flutter/foundation.dart';

class NotaInsert {
  String noteTitle;
  String noteContent;

  NotaInsert(
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