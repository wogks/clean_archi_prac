import 'dart:async';

import 'package:clean_archi_memo/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:clean_archi_memo/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:clean_archi_memo/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/model/note.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;
  const AddEditNoteScreen({super.key, this.note});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  StreamSubscription? _streamSubscription;

  final List<Color> noteColors = [
    rosebud,
    primrose,
    wisteria,
    skyBlue,
    illusion,
  ];

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
    }
    //로드되는 시간 필요
    Future.microtask(() {
      final viewModel = context.read<AddEditNoteViewModel>(); //이니스테이트 안에서는 read
      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(saveNote: () {
          Navigator.pop(context, true);
        }, showSnackBart: (String message) {
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      });
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          viewModel.onEvent(AddEditNoteEvent.saveNote(
            //노트가 널이면 아이디가 널, 노트가 널이 아니면 노트의 아이디
            widget.note == null ? null : widget.note!.id,
            _titleController.text,
            _contentController.text,
          ));
        },
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 48),
        color: Color(viewModel.color),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: noteColors
                  .map((color) => InkWell(
                      onTap: () {
                        viewModel
                            .onEvent(AddEditNoteEvent.changeColor(color.value));
                      },
                      child: _buildBackgroundColor(
                        color: color,
                        selected: viewModel.color == color.value,
                      )))
                  .toList(),
            ),
            TextField(
              controller: _titleController,
              maxLines: 1,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    color: dartGray,
                  ),
              decoration: const InputDecoration(
                  hintText: '제목을 입력하세요', border: InputBorder.none),
            ),
            TextField(
              controller: _contentController,
              maxLines: null, //텍스트 자동 줄바꿈
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: dartGray,
                  ),
              decoration: const InputDecoration(
                  hintText: '내용을 입력하세요', border: InputBorder.none),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundColor({required Color color, required bool selected}) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                spreadRadius: 1)
          ],
          border: selected
              ? Border.all(
                  color: Colors.black,
                  width: 3,
                )
              : null),
    );
  }
}
