import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/note.dart';
import 'package:intl/intl.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const NoteItem({
    super.key,
    required this.note,
    required this.onDelete,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(note.title),
          trailing: Text(DateFormat('d MMM yyyy').format(note.createdAt)),
          onLongPress: onDelete,
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
