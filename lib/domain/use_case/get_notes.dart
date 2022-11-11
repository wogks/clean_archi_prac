import 'package:clean_archi_memo/domain/model/note.dart';
import 'package:clean_archi_memo/domain/repository/note_repository.dart';

class Getnotes {

  final NoteRepository repository;

  Getnotes(this.repository);

  Future<List<Note>> call () async {
    List<Note> notes = await repository.getNotes();
    return notes;
  }
}