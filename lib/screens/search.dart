import 'package:flutter/material.dart';
import 'package:flutter_notes_app/model/note.dart';
import 'package:intl/intl.dart';

class NoteSearchDelegate extends SearchDelegate<String> {
  final List<Note> notes;
  final String searchQuery;

  NoteSearchDelegate(this.notes, this.searchQuery);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredNotes = notes.where((note) => note.title.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: filteredNotes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredNotes[index].title),
          subtitle: Text(filteredNotes[index].content),
          trailing: Text(DateFormat('d MMM yyyy').format(notes[index].createdAt)),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredNotes = notes.where((note) => note.title.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: filteredNotes.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredNotes[index].title),
          trailing: Text(DateFormat('d MMM yyyy').format(notes[index].createdAt)),
        );
      },
    );
  }
}