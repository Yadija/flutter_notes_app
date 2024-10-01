import 'package:flutter/material.dart';
import 'package:flutter_notes_app/model/note.dart';
import 'package:intl/intl.dart';

class Detail extends StatelessWidget {
  final Note note;

  const Detail({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.content,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Created on: ${DateFormat('d MMM yyyy').format(note.createdAt)}',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
