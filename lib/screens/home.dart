import 'package:flutter/material.dart';
import 'package:flutter_notes_app/models/note.dart';
import 'package:flutter_notes_app/screens/add_note.dart';
import 'package:flutter_notes_app/screens/search.dart';
import 'package:flutter_notes_app/screens/detail.dart';
import 'package:flutter_notes_app/widgets/notes_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _deleteNote(int index) {
    setState(() {
      notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes App'),
        backgroundColor: const Color(0xFFFAFAFA),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
              context: context,
              delegate: NoteSearchDelegate(notes),
            );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Divider(height: 1, color: Colors.black),
          Expanded(
            child: NotesList(
              notes: notes,
              onTap: (note) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Detail(note: note)),
                );
              },
              onDelete: _deleteNote,
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
        ),
        child: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddNote()),
            ).then((value) {
              if (value != null) {
                setState(() {
                  notes.add(value);
                });
              }
            });
          },
        ),
      ),
    );
  }
}
