import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'inserir_nota.g.dart';

@JsonSerializable()
class NotaModificada {
  String noteTitle;
  String noteContent;

  NotaModificada({
    @required this.noteTitle,
    @required this.noteContent,
  });

  Map<String, dynamic> toJson() => _$NotaModificadaToJson(this);
}

/*
tem que inseri esse comando na pasta do projeto.

 flutter packages pub run build_runner build --delete-conflicting-outputs

 OBS: Para criação ele demora um pouco para criar o arquivo, sempre lembre de salvar o arquivo para executar o comando.

*/