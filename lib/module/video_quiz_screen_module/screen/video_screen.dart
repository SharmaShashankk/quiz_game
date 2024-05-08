import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:quiz_game/module/quiz_screen_module/screen/quiz_screen.dart';

class VideoScreen extends StatefulWidget {
  final String name, mediaUrl;
  final questions;
  const VideoScreen(
      {super.key,
      required this.name,
      required this.mediaUrl,
      required this.questions});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>
    with SingleTickerProviderStateMixin {
  late BetterPlayerController _betterPlayerController;
  // bool _showStartQuizButton = false;
  bool videoWatched = false;
  GlobalKey _betterPlayerKey = GlobalKey();

  int currentIndex = 0;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
            autoPlay: false, aspectRatio: 16 / 9, fit: BoxFit.contain);
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.mediaUrl,
    );
    videoWatched = false;

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    _betterPlayerController.setBetterPlayerGlobalKey(_betterPlayerKey);

    _betterPlayerController.addEventsListener((event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.finished) {
        setState(() {
          videoWatched = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[800],
      // Color(0xffa15e91),
      appBar: AppBar(
        backgroundColor: Colors.cyan[200],
        title: Text(widget.name),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(
              key: _betterPlayerKey,
              controller: _betterPlayerController,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          if (!videoWatched)
            GestureDetector(
              onTap: () {
                videoWatched = true;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.done_all),
                    Text(
                      'Mark as Done',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          const SizedBox(
            height: 200,
          ),
          ElevatedButton(
            onPressed: videoWatched
                ? () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                              isFromTestQuiz: false,
                              questions: widget.questions,
                              quizTitle: widget.name),
                        ));
                  }
                : null,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[700]),
            child: Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
