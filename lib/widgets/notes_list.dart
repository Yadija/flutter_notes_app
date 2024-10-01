import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/note.dart';
import 'package:flutter_notes_app/widgets/note_item.dart';
import 'package:flutter_notes_app/widgets/delete_note_dialog.dart';

class NotesList extends StatelessWidget {
  final List<Note> notes;
  final Function(Note note) onTap;
  final Function(int index) onDelete;

  const NotesList({
    super.key,
    required this.notes,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return NoteItem(
          note: notes[index],
          onTap: () => onTap(notes[index]),
          onDelete: () {
            showDialog(
              context: context,
              builder: (context) => DeleteNoteDialog(
                onConfirm: () => onDelete(index),
              ),
            );
          },
        );
      },
    );
  }
}
