import 'package:flutter/material.dart';
import 'package:flutter_auto_revision/core/database/database_helper.dart';
import 'package:flutter_auto_revision/core/model/note.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _subjectController =
      TextEditingController();

  final TextEditingController _chapterController =
      TextEditingController();

  final TextEditingController _topicController =
      TextEditingController();

  final TextEditingController _noteController =
      TextEditingController();

  bool _isSaving = false;

  Future<void> _saveNote() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final note = Note(
        subject: _subjectController.text.trim(),
        chapter: _chapterController.text.trim(),
        topic: _topicController.text.trim(),
        note: _noteController.text.trim(),
      );

      await DatabaseHelper.instance.insertNote(note);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Note saved successfully'),
        ),
      );

      Navigator.pop(context, true);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error saving note: $e'),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSaving = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _chapterController.dispose();
    _topicController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return '$label is required';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildTextField(
                controller: _subjectController,
                label: 'Subject',
              ),
              _buildTextField(
                controller: _chapterController,
                label: 'Chapter',
              ),
              _buildTextField(
                controller: _topicController,
                label: 'Topic',
              ),
              Expanded(
                child: TextFormField(
                  controller: _noteController,
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Note is required';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Note (Markdown + LaTeX)',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, // Set the background color to teal
                    foregroundColor: Colors.white, // Set the text color to white
                  ),
                  onPressed: _isSaving ? null : _saveNote,
                  child: _isSaving
                      ? const CircularProgressIndicator()
                      : const Text('Save Note'),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}