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

  Color _color = rosebud;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {},
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding:
            const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 48),
        color: _color,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: noteColors
                  .map((color) => InkWell(
                      onTap: () {
                        setState(() {
                          _color = color;
                        });
                      },
                      child: _buildBackgroundColor(
                        color: color,
                        selected: _color == color,
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
