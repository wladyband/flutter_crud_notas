class Note {
  final String noteID;
  final String noteTitle;
  final DateTime createDateTime;
  final DateTime latestEditDateTime;

  Note(
      {this.noteID,
        this.noteTitle,
        this.createDateTime,
        this.latestEditDateTime});
}
