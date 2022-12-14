import 'package:clean_archi_memo/data/data_source/note_db_helper.dart';
import 'package:clean_archi_memo/data/repository/note_repository_imple.dart';
import 'package:clean_archi_memo/domain/repository/note_repository.dart';
import 'package:clean_archi_memo/domain/use_case/get_note_use_case.dart';
import 'package:clean_archi_memo/domain/use_case/get_notes_use_case.dart';
import 'package:clean_archi_memo/domain/use_case/update_note_use_case.dart';
import 'package:clean_archi_memo/domain/use_case/use_cases.dart';
import 'package:clean_archi_memo/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:clean_archi_memo/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/use_case/add_note_use_case.dart';
import '../domain/use_case/delete_note_use_case.dart';

Future<List<SingleChildWidget>> getProviders() async {
  Database database = await openDatabase(
    'notes_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)',
      );
    },
  );

  NoteDbHelper noteDbHelper = NoteDbHelper(database);
  NoteRepository repository = NoteRepositoryImple(noteDbHelper);
  UseCases useCases = UseCases(
    addNote: AddNoteUseCase(repository),
    deleteNote: DeleteNoteUseCase(repository),
    getnotes: GetnotesUseCase(repository),
    getNote: GetNoteUseCase(repository),
    upadateNote: UpadateNoteUseCase(repository),
  );
  NotesViewModel notesViewModel = NotesViewModel(useCases);
  AddEditNoteViewModel addEditNoteViewModel = AddEditNoteViewModel(repository);

  return [
    ChangeNotifierProvider(create: (_) => notesViewModel),
    ChangeNotifierProvider(create: (_) => addEditNoteViewModel),
  ];
}
