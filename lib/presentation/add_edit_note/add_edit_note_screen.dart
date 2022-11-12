import 'package:clean_archi_memo/ui/colors.dart';
import 'package:flutter/material.dart';


class AddEditNoteScreen extends StatefulWidget {
  const AddEditNoteScreen({super.key});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  final List<Color> noteColors = [
    rosebud,
    primrose,
    wisteria,
    skyBlue,
    illusion,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {},
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: skyBlue,
        child: Column(
          children: [
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
}
