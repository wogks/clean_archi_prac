import 'package:clean_archi_memo/data/data_source/note_db_helper.dart';
import 'package:clean_archi_memo/data/repository/note_repository_imple.dart';
import 'package:clean_archi_memo/domain/repository/note_repository.dart';
import 'package:clean_archi_memo/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:clean_archi_memo/presentation/notes/notes_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:sqflite/sqflite.dart';


Future<List<SingleChildWidget>> getProviders() async {
  Database database =
      await openDatabase('notes_db', version: 1, onCreate: (db, version) async {
    await db.execute(
      'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)',
    );
  },);

  NoteDbHelper noteDbHelper = NoteDbHelper(database);
  NoteRepository repository = NoteRepositoryImple(noteDbHelper);
  NotesViewModel notesViewModel = NotesViewModel(repository);
  AddEditNoteViewModel addEditNoteViewModel = AddEditNoteViewModel(repository);


  return [
    ChangeNotifierProvider(create: (_)=> notesViewModel),
    ChangeNotifierProvider(create: (_)=> addEditNoteViewModel),
  ];
}
