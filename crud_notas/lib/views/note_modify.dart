import 'package:crud_notas/models/inserir_nota.dart';
import 'package:crud_notas/models/nota.dart';
import 'package:crud_notas/services/webclient.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NoteModify extends StatefulWidget {
  final String noteID;

  NoteModify({this.noteID});

  @override
  _NoteModifyState createState() => _NoteModifyState();
}

class _NoteModifyState extends State<NoteModify> {
  bool get isEditing => widget.noteID != null;

  NotasService get notesService => GetIt.I<NotasService>();

  String errorMessage;
  Nota nota;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    if (isEditing) {
      setState(() {
        _isLoading = true;
      });
      notesService.getNota(widget.noteID).then((response) {
        setState(() {
          _isLoading = false;
        });

        if (response.error) {
          errorMessage = response.errorMessage ?? 'An error occurred';
        }
        nota = response.data;
        _titleController.text = nota.noteTitle;
        _contentController.text = nota.noteContent;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Editar Notas' : 'Criando Notas')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: 'Titulo da nota'),
                  ),
                  Container(height: 8),
                  TextField(
                    controller: _contentController,
                    decoration: InputDecoration(hintText: 'Conteúdo da nota'),
                  ),
                  Container(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 35,
                    child: RaisedButton(
                      child:
                          Text('Salvar', style: TextStyle(color: Colors.white)),
                      color: Theme.of(context).primaryColor,
                      onPressed: () async {
                        if (isEditing) {
                          // update note
                        } else {

                          setState(() {
                            _isLoading = true;
                          });

                          final note = NotaInsert(
                              noteTitle: _titleController.text,
                              noteContent: _contentController.text);
                          final result = await notesService.createNote(note);

                          setState(() {
                            _isLoading = false;
                          });

                          final title = 'Done';
                          final text = result.error
                              ? (result.errorMessage ?? 'An error occurred')
                              : 'Your note was created';

                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                    title: Text(title),
                                    content: Text(text),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('Ok'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  )).then((data) {
                            if (result.data) {
                              Navigator.of(context).pop();
                            }
                          });
                        }
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
