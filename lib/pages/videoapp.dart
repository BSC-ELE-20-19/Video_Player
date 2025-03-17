import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  SamplePlayerState createState() => SamplePlayerState();
}

class SamplePlayerState extends State<VideoApp> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.asset("videos/Bob.mp4"),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0f0f0f),
      appBar: AppBar(
        //backgroundColor: Colors.white,
        backgroundColor: const Color(0xFF0f0f0f),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset('icons/previous.png', height: 28, width: 28),
        ),
        title: Text(
          "Mlimi Digital capacity building bulding S01",
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: const Color.fromARGB(255, 138, 138, 138),
              fontWeight: FontWeight.w900,
              fontSize: 28,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset('icons/moreg.png'),
            iconSize: 38,
          ),
        ],
      ),
      body: Center(
        child: FlickVideoPlayer(
          flickManager: flickManager,
          flickVideoWithControls: FlickVideoWithControls(
            videoFit: BoxFit.contain,
            controls: FlickPortraitControls(),
          ),
          flickVideoWithControlsFullscreen: FlickVideoWithControls(
            videoFit: BoxFit.contain,
            controls: FlickLandscapeControls(),
          ),
        ),
      ),
    );
  }
}
