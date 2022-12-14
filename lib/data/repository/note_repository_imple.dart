import 'package:clean_archi_memo/data/data_source/note_db_helper.dart';
import 'package:clean_archi_memo/domain/model/note.dart';
import 'package:clean_archi_memo/domain/repository/note_repository.dart';

class NoteRepositoryImple implements NoteRepository {
  final NoteDbHelper db;
  NoteRepositoryImple(this.db);

  @override
  Future<void> deleteNote(Note note) async {
    await db.deleteNote(note);
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return await db.getNoteById(id);
  }

  @override
  Future<List<Note>> getNotes() async {
    return await db.getNotes();
  }

  @override
  Future<void> insertNote(Note note) async {
    await db.insertNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    await db.updateNote(note);
  }
}
