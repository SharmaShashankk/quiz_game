import 'package:flutter/material.dart';
import 'package:quiz_game/module/quiz_screen_module/screen/quiz_screen.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.question,
    required this.chooseStatus,
    required this.isSelected,
  });

  final String question;
  final int chooseStatus;
  final bool isSelected;

  get widget => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: chooseStatus == 1
                ? Colors.green
                : chooseStatus == 2
                    ? Colors.red
                    : Colors.white,
          ),
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                question,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            chooseStatus == 1
                ? buildCorrectIcon()
                : chooseStatus == 2
                    ? buildWrongIcon()
                    : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
