import 'package:json_annotation/json_annotation.dart';

part 'nota.g.dart';

@JsonSerializable()
class Nota {

  String noteID;
  String noteTitle;
  String noteContent;
  DateTime createDateTime;
  DateTime latestEditDateTime;

  Nota({this.noteID, this.noteTitle, this.noteContent, this.createDateTime, this.latestEditDateTime});

  factory Nota.fromJson(Map<String, dynamic> item) => _$NotaFromJson(item);

}

/*
tem que inseri esse comando na pasta do projeto.

 flutter packages pub run build_runner build --delete-conflicting-outputs

 OBS: Para criação ele demora um pouco para criar o arquivo, sempre lembre de salvar o arquivo para executar o comando.

*/