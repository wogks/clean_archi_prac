import 'package:clean_archi_memo/domain/repository/note_repository.dart';
import 'package:clean_archi_memo/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:flutter/material.dart';

import '../../domain/model/note.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;
  //value = int
  int _color = Colors.orange.value;
  int get color => _color;

  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    //event를 사용할땐 when
    event.when(
      changeColor: _changeColor,
      saveNote: _saveNote,
    );
  }

  Future<void> _changeColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (id == null) {
      await repository.insertNote(
        Note(
            title: title,
            content: content,
            color: _color,
            timestamp: DateTime.now().microsecondsSinceEpoch),
      );
    } else {
      await repository.updateNote(
        Note(
            id: id,
            title: title,
            content: content,
            color: _color,
            timestamp: DateTime.now().microsecondsSinceEpoch),
      );
    }
  }
}