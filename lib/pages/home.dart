import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_video_player/components/videos.dart';
import 'package:my_video_player/components/folders.dart';
import 'package:my_video_player/components/recently.dart';
import 'package:google_fonts/google_fonts.dart';

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
      //backgroundColor: const Color(0xFF0a080b),
      //backgroundColor: const Color(0xFF0f0f0f),
      appBar: AppBar(
        //backgroundColor: Color(0XFF0f0f0f),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search), iconSize: 38),
          /*IconButton(
            onPressed: () {},
            icon: Image.asset('icons/moreg.png'),
            iconSize: 24,
          ),*/
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
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: const Color(0xFF9BCC39),
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                  ),
                ),
              ),
              RecentlyPlayed(number: 3),
              Text(
                "Browse",
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    color: const Color(0xFF9BCC39),
                    fontWeight: FontWeight.w900,
                    fontSize: 28,
                  ),
                ),
              ),
              SizedBox(height: 12),

              Row(
                children: <Widget>[
                  SizedBox(
                    width: 160,
                    height: 48,
                    child: RawMaterialButton(
                      onPressed:
                          () => toggleSelection(true), // Switch to Videos
                      fillColor:
                          isVideoSelected
                              ? Color(0xFF9BCC39)
                              //: Color(0xFFF7F7F7),
                              //: Color(0xFF1b1b1b),
                              : Color(0xFF444444),
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
                    width: 160,
                    height: 48,
                    child: RawMaterialButton(
                      onPressed:
                          () => toggleSelection(false), // Switch to Folders
                      fillColor:
                          !isVideoSelected
                              ? Color(0xFF9BCC39)
                              //: Color(0xFFF7F7F7),
                              : Color(0xFF616161),

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
