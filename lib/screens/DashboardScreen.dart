import 'package:flutter/material.dart';
import 'package:flutter_note_app/databaseHelper.dart';
import 'package:flutter_note_app/screens/NoteForm.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Map<String, dynamic>> _notes = [];

  @override
  void initState() {
    super.initState();
    _refreshNotes();
  }

  void _refreshNotes() async {
    final data = await DatabaseHelper.instance.queryAllRows();
    setState(() {
      _notes = data;
    });
  }

  void _deleteNote(int id) async {
    await DatabaseHelper.instance.delete(id);
    _refreshNotes();
  }

  void _editNote(Map<String, dynamic> note) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteForm(note: note)),
    );
    _refreshNotes();
  }

  void _createNote() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteForm()),
    );
    _refreshNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: ListView.builder(
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];
          return Card(
            child: ListTile(
              title: Text(note['title']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(note['description']),
                  Text('Updated: ${note['updated_time']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editNote(note),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteNote(note['_id']),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNote,
        child: Icon(Icons.add),
      ),
    );
  }
}
