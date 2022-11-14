import 'package:clean_archi_memo/domain/model/note.dart';
import 'package:clean_archi_memo/domain/repository/note_repository.dart';

class GetnotesUseCase {

  final NoteRepository repository;

  GetnotesUseCase(this.repository);

  Future<List<Note>> call () async {
    List<Note> notes = await repository.getNotes();
    notes.sort((a, b) => -a.timestamp.compareTo(b.timestamp));
    return notes;
  }
}
