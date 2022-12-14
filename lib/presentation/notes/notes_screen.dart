import 'package:clean_archi_memo/presentation/add_edit_note/add_edit_note_screen.dart';
import 'package:clean_archi_memo/presentation/notes/components/order_section.dart';
import 'package:clean_archi_memo/presentation/notes/notes_event.dart';
import 'package:clean_archi_memo/presentation/notes/notes_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/use_case/util/note_order.dart';
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
          IconButton(onPressed: () {
            viewModel.onEvent(const NotesEvent.toggleOrderSection());
          }, icon: const Icon(Icons.sort)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isSaved = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEditNoteScreen()),
          );
          if (isSaved != null && isSaved) {
            viewModel.onEvent(const NotesEvent.loadNotes());
          }
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.isOrderSectionVisible ? OrderSection(
              noteOrder: state.noteOrder,
              onOrderChanged: (NoteOrder noteOrder) {
                viewModel.onEvent(NotesEvent.changeOrder(noteOrder));
              },
            ) : Container(),
          ),
          ...state.notes
              .map(
                (note) => GestureDetector(
                  onTap: () async {
                    bool? isSaved = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddEditNoteScreen(
                          note: note,
                        ),
                      ),
                    );
                    if (isSaved != null && isSaved) {
                      viewModel.onEvent(const NotesEvent.loadNotes());
                    }
                  },
                  child: NoteItem(
                    note: note,
                    onDeleteTap: () {
                      viewModel.onEvent(NotesEvent.deleteNote(note));
                      final snackBar = SnackBar(
                        content: const Text('????????? ?????????????????????'),
                        action: SnackBarAction(
                          label: '??????',
                          onPressed: () {
                            viewModel.onEvent(const NotesEvent.restoreNote());
                          },
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  ),
                ),
              )
              .toList(),
        ]),
      ),
    );
  }
}
