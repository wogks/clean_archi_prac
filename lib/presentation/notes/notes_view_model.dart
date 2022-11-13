
import 'package:clean_archi_memo/domain/repository/note_repository.dart';
import 'package:clean_archi_memo/presentation/notes/notes_event.dart';
import 'package:clean_archi_memo/presentation/notes/notes_state.dart';
import 'package:flutter/material.dart';

import '../../domain/model/note.dart';

class NotesViewModel with ChangeNotifier {
  final NoteRepository repository;

  NotesState _state = const NotesState();
  NotesState get state => _state;

//로드 노트에서 가져오면 데이터를 저장할 공간이 필요
//이 상태를 별도의 스테이트클라스로 정의(notes_state.dart)
//스테이트클라스 만들었으니 니제 필요없음
  // List<Note> _notes = [];
  // UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);

  Note? _recentlyDeletedNote;

  NotesViewModel(this.repository){
_loadNotes();
  }

  //이 화면에 발생하는 일들은 온이벤트 메서드를 통해서만 실행한다.
  void onEvent(NotesEvent event) {
    //when을 쓴다(freezed 제공)
    event.when(
        loadNotes: _loadNotes,
        deleteNote: _deleteNote,
        restoreNote: _restoreNote);
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await repository.getNotes();
    _state = state.copyWith(notes: notes);
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await repository.deleteNote(note);

    //마지막에 델리트된 애를 여기다가 저장
    _recentlyDeletedNote = note;

    //삭제하고 데이터 다시 읽어옴
    await _loadNotes();
    //노티는 로드노트에 포함되있으니 안씀
  }

  //로직: 델리트한 노트를 따로 저장함
  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await repository.insertNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null; //리센틀리를 다시 비워줌

      _loadNotes(); //다시 로드
    }
  }
}
