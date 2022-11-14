import 'package:clean_archi_memo/domain/model/note.dart';
import 'package:clean_archi_memo/domain/repository/note_repository.dart';

class AddNoteUseCase {

  final NoteRepository repository;

  AddNoteUseCase(this.repository);

  Future<void> call (Note note) async {
    await repository.insertNote(note);
  }
}