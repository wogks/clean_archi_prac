import 'package:clean_archi_memo/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:clean_archi_memo/presentation/notes/notes_event.dart';
import 'package:clean_archi_memo/presentation/notes/notes_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/note_item.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NotesViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('MY NOTE'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sort)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          bool? isSaved = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEditNoteScreen()),
          );
          if(isSaved != null && isSaved) {
            viewModel.onEvent(const NotesEvent.loadNotes());
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: state.notes.map((note) => NoteItem(note: note)).toList(),
        ),
      ),
    );
  }
}
