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

  factory ListaNotas.fromJson(Map<String, dynamic> item) {
    return ListaNotas(
      noteID: item['noteID'],
      noteTitle: item['noteTitle'],
      createDateTime: DateTime.parse(item['createDateTime']),
      latestEditDateTime: item['latestEditDateTime'] != null
          ? DateTime.parse(item['latestEditDateTime'])
          : null,
    );
  }
}
