import 'package:quiz_game/module/quiz_screen_module/model/questions.dart';

List<QuestionModel> elephantDreamsQuestion = [
  QuestionModel(
    question: 'What is the name of production company ?',
    options: [
      {'option': 'a) The Chillies Open Movie Prjoect', 'choose_status': 0},
      {'option': 'b)The Orange Open Movie Prjoect', 'choose_status': 0},
      {'option': 'c) The Maddockk Open Movie Prjoect', 'choose_status': 0},
      {'option': 'd) The Horizon Open Movie Prjoect', 'choose_status': 0},
    ],
    correctAnswerIndex: 1,
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
