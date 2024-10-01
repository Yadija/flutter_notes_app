import 'package:flutter/material.dart';
import 'package:flutter_notes_app/screens/detail.dart';
import 'package:flutter_notes_app/models/note.dart';
import 'package:flutter_notes_app/widgets/notes_list.dart';

class NoteSearchDelegate extends SearchDelegate<String> {
  final List<Note> notes;

  NoteSearchDelegate(this.notes);

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
    final filteredNotes = notes
        .where((note) => note.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildNoteList(filteredNotes, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredNotes = notes
        .where((note) => note.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return _buildNoteList(filteredNotes, context);
  }

  Widget _buildNoteList(List<Note> filteredNotes, BuildContext context) {
    return Column(
      children: [
        const Divider(height: 1, color: Colors.black),
        if (filteredNotes.isEmpty)
          const Center(child: Text('No notes found.')),
        Expanded(
          child: NotesList(
            notes: filteredNotes,
            onTap: (note) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Detail(note: note)),
              );
            },
            onDelete: (index) {
              // Optionally handle delete action if needed
            },
          ),
        ),
      ],
    );
  }
}
