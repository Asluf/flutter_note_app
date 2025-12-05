import 'package:flutter/material.dart';
import 'package:flutter_note_app/services/databaseHelper.dart';
import 'package:intl/intl.dart';

class NoteForm extends StatefulWidget {
  final Map<String, dynamic>? note;

  const NoteForm({super.key, this.note});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _updatedTime = '';

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!['title'];
      _descriptionController.text = widget.note!['description'];
      _updatedTime = widget.note!['updated_time'];
    }
  }

  void _saveNote() async {
    if (_formKey.currentState!.validate()) {
      String now = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
      if (widget.note == null) {
        // Create a new note
        await DatabaseHelper.instance.insert({
          'title': _titleController.text,
          'description': _descriptionController.text,
          'updated_time': now,
        });
      } else {
        // Update an existing note
        await DatabaseHelper.instance.update({
          '_id': widget.note!['_id'],
          'title': _titleController.text,
          'description': _descriptionController.text,
          'updated_time': now,
        });
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'New Note' : 'Edit Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                minLines: 3,
                maxLines: 10,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _saveNote,
                    child: const Text('Save'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
