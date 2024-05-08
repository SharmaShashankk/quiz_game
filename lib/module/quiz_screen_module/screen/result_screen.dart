import 'package:flutter/material.dart';

import 'package:quiz_game/module/quiz_screen_module/screen/quiz_screen.dart';
import 'package:quiz_game/module/quiz_screen_module/utils/test_quiz_questions.dart';
import 'package:quiz_game/module/video_quiz_screen_module/screen/video_quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.score,
      required this.isFromTestQuiz,
      required this.totalQuestion});

  final int score;
  final bool isFromTestQuiz;
  final int totalQuestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 150),
            const Text(
              'Your Score :',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 150,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: score / totalQuestion,
                    color: Colors.lightGreen,
                    backgroundColor: Colors.white,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      score.toString() + '/ $totalQuestion',
                      style: const TextStyle(fontSize: 60, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${(score / totalQuestion * 100).round()}%',
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 150,
            ),
            ElevatedButton(
                onPressed: () {
                  if (isFromTestQuiz) {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                              isFromTestQuiz: true, questions: testQuestion),
                        ));
                  } else {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const VideoQuizScreen(),
                        ));
                  }
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  isFromTestQuiz ? 'Restart Quiz' : 'Back to video',
                  style: const TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
