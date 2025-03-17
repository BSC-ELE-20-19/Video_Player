import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  VideoAppState createState() => VideoAppState();
}

class VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  Duration _currentPosition = Duration.zero;
  bool _isSeeking = false; // Track if user is dragging

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("videos/Bob.mp4")
      ..initialize().then((_) {
        setState(() {});
      });

    _controller.addListener(() {
      if (!_isSeeking) {
        setState(() {
          _currentPosition = _controller.value.position;
        });
      }
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    return "${twoDigits(duration.inMinutes)}:${twoDigits(duration.inSeconds.remainder(60))}";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playing',
      home: Scaffold(
        backgroundColor: const Color(0xFF0f0f0f),

        body: Center(
          child:
              _controller.value.isInitialized
                  ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      const SizedBox(height: 10),
                      // Progress bar
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_formatDuration(_currentPosition)),
                          Expanded(
                            child: Slider(
                              min: 0,
                              max:
                                  _controller.value.duration.inSeconds
                                      .toDouble(),
                              value: _currentPosition.inSeconds.toDouble(),
                              onChangeStart: (_) {
                                _isSeeking = true; // Start dragging
                              },
                              onChanged: (value) {
                                setState(() {
                                  _currentPosition = Duration(
                                    seconds: value.toInt(),
                                  );
                                });
                              },
                              onChangeEnd: (value) {
                                _isSeeking = false; // Stop dragging
                                _controller.seekTo(
                                  Duration(seconds: value.toInt()),
                                );
                              },
                            ),
                          ),
                          Text(_formatDuration(_controller.value.duration)),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Control buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                            ),
                            onPressed: () {
                              setState(() {
                                _controller.value.isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                  : const CircularProgressIndicator(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
