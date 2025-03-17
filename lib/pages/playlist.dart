import 'package:flutter/material.dart';
import 'package:my_video_player/components/videos.dart';
import 'package:google_fonts/google_fonts.dart';

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  PlaylistState createState() => PlaylistState();
}

class PlaylistState extends State<Playlist> {
  /*bool isVideoSelected = true;

  void toggleSelection(bool isVideo) {
    setState(() {
      isVideoSelected = isVideo;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xFF0a080b),
      //backgroundColor: const Color(0xFF1b1e21),
      //backgroundColor: Colors.white,
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

        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search), iconSize: 38),
          IconButton(
            onPressed: () {},
            icon: Image.asset('icons/moreg.png'),
            iconSize: 38,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Folder name one",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: const Color.fromARGB(255, 138, 138, 138),
                    fontWeight: FontWeight.w900,
                    fontSize: 34,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Video(
                    text: "09 February, 2025",
                    number: 17,
                  ), // Show Videos component
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
