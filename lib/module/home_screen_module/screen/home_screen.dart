import 'package:flutter/material.dart';
import 'package:quiz_game/module/quiz_screen_module/screen/quiz_screen.dart';
import 'package:quiz_game/module/quiz_screen_module/utils/test_quiz_questions.dart';
import 'package:quiz_game/module/video_quiz_screen_module/screen/video_quiz_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                          isFromTestQuiz: true, questions: testQuestion),
                    ));
              },
              child: const Text('Start Text Quiz'),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VideoQuizScreen(),
                      ));
                },
                child: const Text('Start Video Quiz'))
          ],
        ),
      ),
    );
  }
}
