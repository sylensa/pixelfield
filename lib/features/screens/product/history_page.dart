import 'package:flutter/material.dart';
import 'package:pixelfield/features/screens/widgets/history_widget.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        HistoryWidget(
          title: 'Title',
          description: 'Description',
          label: 'Label',
          isLast: false,
          isFirst: true,
        ),
        HistoryWidget(
          title: 'Label',
          description: 'Description',
          label: 'Label',
          isLast: true,
          isFirst: false,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
