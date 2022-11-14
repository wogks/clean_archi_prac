import 'package:clean_archi_memo/domain/model/note.dart';
import 'package:clean_archi_memo/domain/use_case/util/note_order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notes_event.freezed.dart';
//한 화면에 일어나는 모든 일들을 정리
//인간이 놓칠수도 있는걸 안놓치기 위해 작성
@freezed
abstract class NotesEvent<T> with _$NotesEvent {
  const factory NotesEvent.loadNotes() = LoadNotes; //LoadNotes라는 타입으로 만들어준다, 타입의 클라스이름을 작성하면 된다
  const factory NotesEvent.deleteNote(Note note) = DeleteNote;
  const factory NotesEvent.restoreNote() = RestoreNote;
  const factory NotesEvent.changeOrder(NoteOrder noteOrder) = ChangeOrder;
  const factory NotesEvent.toggleOrderSection() = toggleOrderSection;
}