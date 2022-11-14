import 'package:clean_archi_memo/domain/use_case/add_note_use_case.dart';
import 'package:clean_archi_memo/domain/use_case/delete_note_use_case.dart';
import 'package:clean_archi_memo/domain/use_case/get_note_use_case.dart';
import 'package:clean_archi_memo/domain/use_case/get_notes_use_case.dart';
import 'package:clean_archi_memo/domain/use_case/update_note_use_case.dart';

class UseCases {
  final AddNoteUseCase addNote;
  final DeleteNoteUseCase deleteNote;
  final GetnotesUseCase getnotes;
  final GetNoteUseCase getNote;
  final UpadateNoteUseCase upadateNote;

  UseCases({
    required this.addNote,
    required this.deleteNote,
    required this.getnotes,
    required this.getNote,
    required this.upadateNote,
  });
}
