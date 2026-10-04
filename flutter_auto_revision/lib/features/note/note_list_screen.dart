import 'package:flutter/material.dart';
import 'package:flutter_auto_revision/core/database/database_helper.dart';
import 'package:flutter_auto_revision/core/model/note.dart';
import 'package:flutter_auto_revision/core/notification_service.dart';
import 'package:flutter_auto_revision/features/note/add_note_screen.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({super.key});

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  List<Note> _notes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final notes = await DatabaseHelper.instance.getNotes();

      if (!mounted) return;

      setState(() {
        _notes = notes;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error loading notes: $e'),
        ),
      );
    }
  }

  Future<void> _addNote() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddNoteScreen(),
      ),
    );

    // AddNoteScreen returns true after successfully saving
    if (result == true) {
      _loadNotes();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),

      body: _buildBody(),

      floatingActionButton: FloatingActionButton(
        // onPressed: _addNote,
        onPressed: () {
         NotificationService.scheduleNotification();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_notes.isEmpty) {
      return const Center(
        child: Text(
          'No notes found',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadNotes,
      child: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          final note = _notes[index];

          return _buildNoteCard(note);
        },
      ),
    );
  }

  Widget _buildNoteCard(Note note) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),

        title: Text(
          note.topic,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.subject,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                note.chapter,
              ),
              const SizedBox(height: 8),
              Text(
                note.note,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),

        onTap: () {
          // Open note detail screen here later
        },
      ),
    );
  }
}