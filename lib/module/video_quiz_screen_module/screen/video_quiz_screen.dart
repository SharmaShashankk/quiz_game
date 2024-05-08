import 'package:flutter/material.dart';
import 'package:quiz_game/module/quiz_screen_module/utils/big_buck_buuny_questions.dart';
import 'package:quiz_game/module/quiz_screen_module/utils/elephant_dreams_questions.dart';
import 'package:quiz_game/module/quiz_screen_module/utils/for_bigger_blazes_questions.dart';
import 'package:quiz_game/module/quiz_screen_module/utils/for_bigger_escape_questions.dart';
import 'package:quiz_game/module/quiz_screen_module/utils/for_bigger_fun_questions.dart';

import 'package:quiz_game/module/video_quiz_screen_module/screen/video_screen.dart';


class VideoQuizScreen extends StatefulWidget {
  const VideoQuizScreen({super.key});

  @override
  State<VideoQuizScreen> createState() => _VideoQuizScreenState();
}

class _VideoQuizScreenState extends State<VideoQuizScreen> {
  var videoList = [
    {
      'name': 'Big Buck Bunny',
      'media_url':
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      'thumb_url':
          'https://m.media-amazon.com/images/M/MV5BNDFkMWMxY2QtYjQyNi00MjkwLTljYjMtYzUwZDlhODlhNzY3XkEyXkFqcGdeQXVyNDgyODgxNjE@._V1_.jpg',
      'quiz_questions': bigBuckBunnyQuestion
    },
    {
      'name': 'Elephant Dreams',
      'media_url':
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
      'thumb_url':
          'https://www.spiritanimals.org/wp-content/uploads/2022/05/elephant.jpg',
      'quiz_questions': elephantDreamsQuestion
    },
    {
      'name': 'For Bigger Blazes',
      'media_url':
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
      'thumb_url': 'https://i.ytimg.com/vi/UIQiuLbxFFk/maxresdefault.jpg',
      'quiz_questions': forBiggerBlazesQuestion
    },
    {
      'name': 'For Bigger Escape',
      'media_url':
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
      'thumb_url':
          'https://assets.tvokids.com/prod/s3fs-public/custom_brand_hero_images/tileSM_bigEscape1.jpg',
      'quiz_questions': forBiggerEscapeQuestion
    },
    {
      'name': 'For Bigger Fun',
      'media_url':
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4',
      'thumb_url':
          'https://www.pearsonelt.es/content/dam/professional/english/pearsonelt-es/catalogue/9780133437447.jpg',
      'quiz_questions': forBiggerFunQuestion
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView.builder(
        itemCount: videoList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoScreen(
                        name: videoList[index]['name']! as String,
                        mediaUrl: videoList[index]['media_url']! as String,
                        questions: videoList[index]['quiz_questions'],
                      ),
                    ));
              },
              child: Image.network(videoList[index]['thumb_url']! as String),
            ),
          );
        },
      )),
    );
  }
}
