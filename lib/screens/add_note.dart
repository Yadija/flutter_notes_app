import 'package:flutter/material.dart';
import 'package:flutter_notes_app/model/note.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _content = '';
  bool _isButtonEnabled = false;

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _title.isNotEmpty && _content.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
        backgroundColor: const Color(0xFFFAFAFA),
      ),
      body: Column(
        children: [
          const Divider(height: 1, color: Colors.black),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Title',
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(fontSize: 24),
                        onChanged: (value) {
                          _title = value;
                          _updateButtonState();
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Write something...',
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(fontSize: 16),
                        onChanged: (value) {
                          _content = value;
                          _updateButtonState();
                        },
                        maxLines: null,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isButtonEnabled ? () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            Navigator.pop(context, Note(_title, _content));
          }
        } : null,
        backgroundColor: _isButtonEnabled ? null : Colors.transparent,
        elevation: _isButtonEnabled ? 6.0 : 0.0,
        child: Icon(
          Icons.add,
          color: _isButtonEnabled ? null : Colors.grey,
        ),
      ),
    );
  }
}
