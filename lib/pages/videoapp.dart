import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              double videoWidth = constraints.maxWidth;
              double videoHeight =
                  constraints.maxHeight * 0.6; // 60% of screen height

              return Center(
                child:
                    _controller.value.isInitialized
                        ? Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: videoWidth,
                                height: videoHeight,
                                child: VideoPlayer(_controller),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(_formatDuration(_currentPosition)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        _formatDuration(
                                          _controller.value.duration,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Slider(
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
                            ],
                          ),
                        )
                        : const CircularProgressIndicator(),
              );
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
