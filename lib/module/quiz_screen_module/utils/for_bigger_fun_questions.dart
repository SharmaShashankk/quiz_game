import 'package:quiz_game/module/quiz_screen_module/model/questions.dart';

List<QuestionModel> forBiggerFunQuestion = [
  QuestionModel(
    question: 'Which is the highest peak in the world?',
    options: [
      {'option': 'a) Mt.Kanchenjunga', 'choose_status': 0},
      {'option': 'b) Mt.K2', 'choose_status': 0},
      {'option': 'c) Mt.Nanga Parbat', 'choose_status': 0},
      {'option': 'd) Mt.Everest', 'choose_status': 0},
    ],
    correctAnswerIndex: 3,
    isSelected: false,
  ),
  QuestionModel(
    question:
        'Mountaineers carry oxygen cylinder with them because they need it for',
    options: [
      {'option': 'a) Cooking Food on the mountains', 'choose_status': 0},
      {
        'option': 'b) Keeping them warm by burning oxygen in it',
        'choose_status': 0
      },
      {
        'option': 'c) Breathing as less oxygen is available at high altitudes',
        'choose_status': 0
      },
      {'option': 'd) All of the Above', 'choose_status': 0},
    ],
    correctAnswerIndex: 2,
    isSelected: false,
  ),
];
