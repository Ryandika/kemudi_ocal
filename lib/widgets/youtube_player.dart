import 'package:flutter/material.dart';
import 'package:login_regist/models/lesson_details.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWidget extends StatefulWidget {
  const YoutubePlayerWidget({super.key, required this.lesson, required this.onVideoPlay});

  final LessonDetail lesson;
  final void Function(LessonDetail video) onVideoPlay;

  @override
  State<YoutubePlayerWidget> createState() => _YoutubePlayerWidgetState();
}

class _YoutubePlayerWidgetState extends State<YoutubePlayerWidget> {
  @override
  Widget build(BuildContext context) {
    late YoutubePlayerController controller;
 

    @override
    void initState() {
      final videoID = YoutubePlayer.convertUrlToId(widget.lesson.video[0]);


      controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
      );
      
      super.initState();
    }

    return YoutubePlayer(
      controller: controller,
      showVideoProgressIndicator: true,
      bottomActions: [
        CurrentPosition(),
        ProgressBar(
          isExpanded: true,
          colors: const ProgressBarColors(
            playedColor: Colors.amber,
            handleColor: Colors.amberAccent,
          ),
        ),
        RemainingDuration(),
        const PlaybackSpeedButton(),
        FullScreenButton(),
      ],
    );
  }
}
