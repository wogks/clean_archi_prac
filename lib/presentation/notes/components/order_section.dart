import 'package:clean_archi_memo/domain/use_case/util/note_order.dart';
import 'package:clean_archi_memo/domain/use_case/util/order_type.dart';
import 'package:flutter/material.dart';

class OrderSection extends StatelessWidget {
  final NoteOrder noteOrder;
  final Function(NoteOrder noteOrder) onOrderChanged;
  const OrderSection(
      {super.key, required this.onOrderChanged, required this.noteOrder});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Radio<NoteOrder>(
              activeColor: Colors.white,
              value: NoteOrder.title(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.title(noteOrder.orderType));
              },
            ),
            const Text('제목'),
            Radio<NoteOrder>(
              activeColor: Colors.white,
              value: NoteOrder.date(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.date(noteOrder.orderType));
              },
            ),
            const Text('날짜'),
            Radio<NoteOrder>(
              activeColor: Colors.white,
              value: NoteOrder.color(noteOrder.orderType),
              groupValue: noteOrder,
              onChanged: (NoteOrder? value) {
                onOrderChanged(NoteOrder.color(noteOrder.orderType));
              },
            ),
            const Text('색상'),
          ],
        ),
        Row(
          children: [
            Radio<OrderType>(
              activeColor: Colors.white,
              value: const OrderType.ascending(),
              groupValue: noteOrder.orderType,
              onChanged: (OrderType? value) {
                onOrderChanged(
                  noteOrder.copyWith(
                    orderType: const OrderType.ascending(),
                  ),
                );
              },
            ),
            const Text('오름차순'),
            Radio<OrderType>(
              activeColor: Colors.white,
              value: const OrderType.descending(),
              groupValue: noteOrder.orderType,
              onChanged: (OrderType? value) {
                onOrderChanged(
                  noteOrder.copyWith(
                    orderType: const OrderType.descending(),
                  ),
                );
              },
            ),
            const Text('내림차순'),
          ],
        ),
      ],
    );
  }
}
