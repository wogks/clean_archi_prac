import 'package:clean_archi_memo/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:clean_archi_memo/ui/colors.dart';
import 'package:flutter/material.dart';

import '../../domain/model/note.dart';
import 'components/note_item.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('MY NOTE'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEditNoteScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            NoteItem(
                note: Note(
              title: 'asd',
              content: 'asd',
              color: wisteria.value,
              timestamp: 1,
            )),
            NoteItem(
                note: Note(
              title: '1',
              content: '1',
              color: skyBlue.value,
              timestamp: 1,
            ))
          ],
        ),
      ),
    );
  }
}
