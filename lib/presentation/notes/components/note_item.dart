import 'package:flutter/material.dart';

import '../../../domain/model/note.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final Function? onDeleteTap;
  const NoteItem({super.key, required this.note, this.onDeleteTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(note.color)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title, style: Theme.of(context).textTheme.headline6,
                  maxLines: 1, // 한줄
                  overflow: TextOverflow.ellipsis, // 한줄 넘어가면 ...으로 됨
                ),
                const SizedBox(height: 8),
                Text(
                  note.content,
                  style: Theme.of(context).textTheme.bodyText2,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 8,
            right: 8,
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
