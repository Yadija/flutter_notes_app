// search.dart
import 'package:flutter/material.dart';
import 'package:flutter_notes_app/screens/detail.dart';
import 'package:flutter_notes_app/models/note.dart';
import 'package:flutter_notes_app/widgets/notes_list.dart';

class NoteSearchDelegate extends SearchDelegate<String> {
  final List<Note> notes;
  final Function(int) onDelete;

  NoteSearchDelegate(this.notes, this.onDelete);

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
        Expanded(
          child: NotesList(
            notes: filteredNotes,
            onTap: (note) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Detail(note: note, onDelete: () {
                  final index = notes.indexOf(note);
                  if (index != -1) {
                    onDelete(index);
                    Navigator.pop(context);
                  }
                })),
              );
            },
            onDelete: (index) {
              onDelete(index);
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
