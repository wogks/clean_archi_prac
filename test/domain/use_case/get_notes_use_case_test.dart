import 'package:clean_archi_memo/domain/model/note.dart';
import 'package:clean_archi_memo/domain/repository/note_repository.dart';
import 'package:clean_archi_memo/domain/use_case/get_note_use_case.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_notes_use_case_test.mocks.dart';

@GenerateMocks([NoteRepository])
void main() {
  test('정렬기능이 잘 동작해야 한다', () async {
    final repository = MockNoteRepository();
    final getNotes = GetNoteUseCase(repository);

    when(repository.getNotes()).thenAnswer((_) async => const [
          Note(timestamp: 1, title: 'tile', color: 1, content: 'content'),
          Note(timestamp: 2, title: 'tile2', color: 2, content: 'content2'),
        ]);
  });
}
