import 'package:quiz_game/module/quiz_screen_module/model/questions.dart';

List<QuestionModel> bigBuckBunnyQuestion = [
  QuestionModel(
    question: 'Whom bunny is chasing ?',
    options: [
      {'option': 'a) Rat', 'choose_status': 0},
      {'option': 'b) Squirrel', 'choose_status': 0},
      {'option': 'c) Butterfly', 'choose_status': 0},
      {'option': 'd) Ants', 'choose_status': 0},
    ],
    correctAnswerIndex: 2,
    isSelected: false,
  ),
  QuestionModel(
    question: 'With which thing buuny is attacking their enemies?',
    options: [
      {'option': 'a) Sword', 'choose_status': 0},
      {'option': 'b) Wood', 'choose_status': 0},
      {'option': 'c) Bow and Arrow', 'choose_status': 0},
      {'option': 'd) Stones', 'choose_status': 0},
    ],
    correctAnswerIndex: 2,
    isSelected: false,
  ),
  QuestionModel(
    question: 'How many attackers are attacking on bunny?',
    options: [
      {'option': 'a) 3', 'choose_status': 0},
      {'option': 'b) 5', 'choose_status': 0},
      {'option': 'c) 2', 'choose_status': 0},
      {'option': 'd) 6', 'choose_status': 0},
    ],
    correctAnswerIndex: 0,
    isSelected: false,
  ),
];
