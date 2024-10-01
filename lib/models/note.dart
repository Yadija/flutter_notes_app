class Note {
  String title;
  String content;
  DateTime createdAt;
  bool isArchived;

  Note(this.title, this.content, {this.isArchived = false, DateTime? createdAt}) : createdAt = createdAt ?? DateTime.now();
}

List<Note> notes = [
  Note('Dart', 'Dart is a programming language for building apps', createdAt: DateTime.now().subtract(const Duration(days: 2))),
  Note('Flutter', 'Flutter is great for building mobile apps', createdAt: DateTime.now()),
];

