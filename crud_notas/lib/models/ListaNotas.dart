import 'package:json_annotation/json_annotation.dart';
part 'ListaNotas.g.dart';

@JsonSerializable()
class ListaNotas {
  String noteID;
  String noteTitle;
  DateTime createDateTime;
  DateTime latestEditDateTime;

  ListaNotas(
      {this.noteID,
      this.noteTitle,
      this.createDateTime,
      this.latestEditDateTime});

  factory ListaNotas.fromJson(Map<String, dynamic> item) => _$ListaNotasFromJson(item);

}
/*
tem que inseri esse comando na pasta do projeto.

 flutter packages pub run build_runner build --delete-conflicting-outputs

 OBS: Para criação ele demora um pouco para criar o arquivo, sempre lembre de salvar o arquivo para executar o comando.

*/