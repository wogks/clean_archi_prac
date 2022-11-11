import 'package:clean_archi_memo/domain/model/note.dart';
import 'package:clean_archi_memo/domain/repository/note_repository.dart';

class AddNote {

  final NoteRepository repository;

  AddNote(this.repository);

  Future<void> call (Note note) async {
    await repository.insertNote(note);
  }
}