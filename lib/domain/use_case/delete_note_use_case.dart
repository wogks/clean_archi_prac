import 'package:clean_archi_memo/domain/model/note.dart';
import 'package:clean_archi_memo/domain/repository/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  Future <void> call (Note note) async {
    await repository.deleteNote(note);
  }
}
