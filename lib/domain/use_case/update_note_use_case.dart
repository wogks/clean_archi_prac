import 'package:clean_archi_memo/domain/repository/note_repository.dart';

import '../model/note.dart';

class UpadateNoteUseCase {
  final NoteRepository repository;

  UpadateNoteUseCase(this.repository);

  Future<void> call(Note note) async {
    await repository.updateNote(note);
  }
}
