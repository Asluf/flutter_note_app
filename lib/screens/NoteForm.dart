import 'package:flutter/material.dart';
import 'package:flutter_note_app/databaseHelper.dart';
import 'package:intl/intl.dart';

class NoteForm extends StatefulWidget {
  final Map<String, dynamic>? note;

  const NoteForm({super.key, this.note});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
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
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveNote,
                child: Text('Save'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
