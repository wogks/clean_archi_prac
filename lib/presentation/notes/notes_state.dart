import 'package:clean_archi_memo/domain/use_case/util/note_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/note.dart';

part 'notes_state.freezed.dart';

//part 'notes_state.g.dart'; 제이슨만들때 필요

@freezed
class NotesState with _$NotesState {
  const factory NotesState({
    required List<Note> notes,
    required NoteOrder noteOrder,
    required bool isOrderSectionVisible,
  }) = _NotesState;

//factory NotesState.fromJson(Map<String, Object?> json) => _$NotesStateFromJson(json); json필요없음, 여기서 에러
}