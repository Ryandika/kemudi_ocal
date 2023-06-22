import 'dart:ffi';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:login_regist/main.dart';
import 'package:login_regist/models/lesson_details.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonDetailsScreen extends StatefulWidget {
  const LessonDetailsScreen({
    super.key,
    required this.lesson,
  });

  final LessonDetail lesson;

  @override
  State<LessonDetailsScreen> createState() => _LessonDetailsScreenState();
}

class _LessonDetailsScreenState extends State<LessonDetailsScreen> {
  late YoutubePlayerController _controller;
  // late YoutubePlayerController _controller2;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.lesson.video[0]);
    final videoID2 = YoutubePlayer.convertUrlToId(widget.lesson.video[1]);

    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );

    // _controller2 = YoutubePlayerController(
    //   initialVideoId: videoID2!,
    //   flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    // );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: ListView(
          children: [
            Column(
              children: [
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.lesson.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Pelajaran 10 Menit",
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      // Container(
                      //   margin: const EdgeInsets.symmetric(
                      //       vertical: 5, horizontal: 10),
                      //   alignment: Alignment.topLeft,
                      //   child: const Text(
                      //     "Mobil Manual",
                      //     style: TextStyle(
                      //         fontWeight: FontWeight.bold, fontSize: 18),
                      //   ),
                      // ),
                      for (final lessons in widget.lesson.lesson)
                        Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          padding: EdgeInsets.only(top: 10),
                          alignment: Alignment.topLeft,
                          child: Text(
                            lessons,
                            style:
                                const TextStyle(fontSize: 16, letterSpacing: 1),
                          ),
                        ),
                      YoutubePlayer(
                        controller: _controller,
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
                      ),
                      // YoutubePlayer(
                      //   controller: _controller2,
                      //   showVideoProgressIndicator: true,
                      //   bottomActions: [
                      //     CurrentPosition(),
                      //     ProgressBar(
                      //       isExpanded: true,
                      //       colors: const ProgressBarColors(
                      //         playedColor: Colors.amber,
                      //         handleColor: Colors.amberAccent,
                      //       ),
                      //     ),
                      //     RemainingDuration(),
                      //     const PlaybackSpeedButton(),
                      //     FullScreenButton(),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//--Tombol buat balik ke halaman sebelumnya
  // Center(
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     child: const Text('Go Back!'),
                //   ),
                // ),