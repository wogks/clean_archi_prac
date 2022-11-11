import 'package:clean_archi_memo/domain/repository/note_repository.dart';

import '../model/note.dart';

class GetNote {
  final NoteRepository repository;

  GetNote(this.repository);

  Future<Note?> call(int id) async {
    return await repository.getNoteById(id);
  }
}
