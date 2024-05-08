import 'package:flutter/material.dart';

import 'package:quiz_game/module/quiz_screen_module/widgets/answer_card.dart';

import 'package:quiz_game/module/quiz_screen_module/screen/result_screen.dart';

class QuizScreen extends StatefulWidget {
  final bool isFromTestQuiz;
  final questions;
  final String quizTitle;

  const QuizScreen(
      {super.key,
      required this.questions,
      required this.isFromTestQuiz,
      this.quizTitle = 'Test Quiz'});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  dynamic question;

  @override
  void initState() {
    initializeValue();

    super.initState();
  }

  int selectedAnswerIndex = 0;
  int questionIndex = 0;
  int score = 0;

  initializeValue() {
    for (var qus in widget.questions) {
      qus.isSelected = false;
      qus.options.forEach((element) {
        element['choose_status'] = 0;
      });
    }
    widget.questions.shuffle();
    question = widget.questions[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      appBar: AppBar(
        title: Text(widget.quizTitle),
        // automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.cyan[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${currentIndex + 1}. ${question.question}',
              style: const TextStyle(
                fontSize: 21,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (question.isSelected == false) {
                      setState(() {
                        if (index == question.correctAnswerIndex) {
                          question.options[index]['choose_status'] = 1;
                          question.isSelected = true;
                          score = score + 1;
                        } else {
                          question.options[index]['choose_status'] = 2;
                          question.isSelected = true;
                        }
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('You already submit the answer'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  },
                  child: AnswerCard(
                    question: question.options[index]['option'],
                    chooseStatus: question.options[index]['choose_status'],
                    isSelected: question.isSelected,
                  ),
                );
              },
            ),
            question.isSelected
                ? ElevatedButton(
                    onPressed: () {
                      if (currentIndex == widget.questions.length - 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultScreen(
                                  score: score,
                                  isFromTestQuiz: widget.isFromTestQuiz,
                                  totalQuestion: widget.questions.length),
                            ));
                      } else {
                        setState(() {
                          question = widget.questions[++currentIndex];
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900]),
                    child: Text(
                        style: const TextStyle(color: Colors.white),
                        currentIndex == widget.questions.length - 1
                            ? 'Finish'
                            : 'Next Question'),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

Widget buildCorrectIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.green,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );

Widget buildWrongIcon() => const CircleAvatar(
      radius: 15,
      backgroundColor: Colors.red,
      child: Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
