// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListaNotas.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListaNotas _$ListaNotasFromJson(Map<String, dynamic> json) {
  return ListaNotas(
    noteID: json['noteID'] as String,
    noteTitle: json['noteTitle'] as String,
    createDateTime: json['createDateTime'] == null
        ? null
        : DateTime.parse(json['createDateTime'] as String),
    latestEditDateTime: json['latestEditDateTime'] == null
        ? null
        : DateTime.parse(json['latestEditDateTime'] as String),
  );
}

Map<String, dynamic> _$ListaNotasToJson(ListaNotas instance) =>
    <String, dynamic>{
      'noteID': instance.noteID,
      'noteTitle': instance.noteTitle,
      'createDateTime': instance.createDateTime?.toIso8601String(),
      'latestEditDateTime': instance.latestEditDateTime?.toIso8601String(),
    };
