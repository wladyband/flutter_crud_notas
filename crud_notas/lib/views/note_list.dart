import 'package:crud_notas/models/api_response.dart';
import 'package:crud_notas/models/ListaNotas.dart';
import 'package:crud_notas/services/webclient.dart';
import 'package:crud_notas/views/note_delete.dart';
import 'package:crud_notas/views/note_modify.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NotasService get service => GetIt.I<NotasService>();

  APIResponse<List<ListaNotas>> _apiResponse;
  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    _fetchNotes(); //todo
    super.initState();
  }

  _fetchNotes() async {
    //todo
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getNotesList();

    setState(() {
      //todo
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lista de Notas'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .push(
                          MaterialPageRoute(builder: (context) => NoteModify()))
                      .then((_) {
                    _fetchNotes();
                  });
                })
          ],
        ),
        body: Builder(
          builder: (context) {
            if (_isLoading) {
              return CircularProgressIndicator();
            }
            if (_apiResponse?.error) {
              return Center(child: Text(_apiResponse.errorMessage));
            }
            return ListView.separated(
              // Também poderia ser feito dessa forma ==>  separatorBuilder: (BuildContext context, int index) => Divider(height: 1, color: Colors.green),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 1,
                  color: Colors.green,
                );
              },
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(_apiResponse.data[index].noteID),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context, builder: (context) => NoteDelete());
                    //ação de exclusão
                    if (result) {
                      final deleteResult = await service.deleteNote(_apiResponse.data[index].noteID);

                      var message;
                      if (deleteResult != null && deleteResult.data == true) {
                        message = 'Sua nota foi excluída com sucesso';
                      } else {
                        message = deleteResult?.errorMessage ?? 'Erro ao tentar excluir';
                      }

                      showDialog(
                          context: context, builder: (_) => AlertDialog(
                        title: Text('Executado'),
                        content: Text(message),
                        actions: <Widget>[
                          FlatButton(child: Text('Ok'), onPressed: () {
                            Navigator.of(context).pop();
                          })
                        ],
                      ));

                      return deleteResult?.data ?? false;
                    }
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      child: Icon(Icons.delete, color: Colors.white),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      _apiResponse.data[index].noteTitle,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text(
                        'Últimas alterações foram em ${formatDateTime(_apiResponse.data[index].latestEditDateTime ?? _apiResponse.data[index].createDateTime)}'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => NoteModify(
                              noteID: _apiResponse.data[index].noteID))).then((data) {
                        _fetchNotes();
                      });
                    },
                  ),
                );
              },
              itemCount: _apiResponse.data.length,
            );
          },
        ));
  }
}
