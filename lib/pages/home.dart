import 'package:flutter/material.dart';
import 'package:video_player/components/videos.dart';
import 'package:video_player/components/folders.dart';
import 'package:video_player/components/recently.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isVideoSelected = true;

  void toggleSelection(bool isVideo) {
    setState(() {
      isVideoSelected = isVideo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                "Recent Media",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xFF9BCC39),
                  fontSize: 32,
                ),
              ),
              RecentlyPlayed(number: 5),
              SizedBox(height: 38),
              Text(
                "Browse",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xFF9BCC39),
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 12),

              Row(
                children: <Widget>[
                  SizedBox(
                    width: 185,
                    height: 60,
                    child: RawMaterialButton(
                      onPressed:
                          () => toggleSelection(true), // Switch to Videos
                      fillColor:
                          isVideoSelected
                              ? Color(0xFF9BCC39)
                              : Color(0xFFF7F7F7),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'VIDEOS',
                        style: TextStyle(
                          color: isVideoSelected ? Colors.white : Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 185,
                    height: 60,
                    child: RawMaterialButton(
                      onPressed:
                          () => toggleSelection(false), // Switch to Folders
                      fillColor:
                          !isVideoSelected
                              ? Color(0xFF9BCC39)
                              : Color(0xFFF7F7F7),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'FOLDERS',
                        style: TextStyle(
                          color: !isVideoSelected ? Colors.white : Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  /*Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'icons/sort.png',
                            width: 38,
                            height: 38,
                            fit: BoxFit.cover,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'icons/view-list.png',
                            width: 38,
                            height: 38,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),*/
                ],
              ),

              SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  child:
                      isVideoSelected
                          ? Video(
                            text: "09 February, 2025",
                            number: 7,
                          ) // Show Videos component
                          : Folder(
                            folderName: "Video",
                            folderCount: 17,
                          ), // Show Folders component
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
