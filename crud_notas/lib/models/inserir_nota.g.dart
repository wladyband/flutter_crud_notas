// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inserir_nota.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotaModificada _$NotaModificadaFromJson(Map<String, dynamic> json) {
  return NotaModificada(
    noteTitle: json['noteTitle'] as String,
    noteContent: json['noteContent'] as String,
  );
}

Map<String, dynamic> _$NotaModificadaToJson(NotaModificada instance) =>
    <String, dynamic>{
      'noteTitle': instance.noteTitle,
      'noteContent': instance.noteContent,
    };
