import 'package:flutter/material.dart';
import 'package:video_player/components/videos.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset('icons/previous.png', height: 28, width: 28),
        ),

        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search), iconSize: 38),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xFF9BCC39),
                  fontSize: 32,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Video(
                    text: "09 February, 2025",
                    number: 7,
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
