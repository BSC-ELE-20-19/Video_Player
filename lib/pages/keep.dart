import 'package:flutter/material.dart';
//import 'package:video_player/components/videos.dart';
import 'package:my_video_player/components/folders.dart';
import 'package:my_video_player/components/recently.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        /**leading: Image.asset(
          'images/logo.png',
          width: 45,
          height: 48,
          fit: BoxFit.cover,
        ),**/
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
              Padding(padding: EdgeInsets.only(top: 38.0)),
              Text(
                "Browse",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  color: Color(0xFF9BCC39),
                  fontSize: 32,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 12.0)),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 185,
                    height: 60,
                    child: RawMaterialButton(
                      onPressed: () {},
                      fillColor: Color(0xFF9BCC39),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'VIDEOS',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  SizedBox(
                    width: 185,
                    height: 60,
                    child: RawMaterialButton(
                      onPressed: () {},
                      fillColor: Color(0xFFF7f7f7),
                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'FOLDERS',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                  Expanded(
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
                  ),
                ],
              ),
              //Video(text: "03 February, 2025", number: 2),
              //Video(text: "09 February, 2025", number: 3),
              //Video(text: "17 February, 2025", number: 4),
              //Video(text: "01 May, 2025", number: 5),
              Expanded(
                child: SingleChildScrollView(
                  child: Folder(folderName: "Video", folderCount: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text headTitle() {
    return Text(
      "Browse",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
        color: Color(0xFF9BCC39),
        fontSize: 32,
      ),
    );
  }

  SingleChildScrollView recentMedia() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Container(color: Colors.yellow, height: 160, width: 200),
          Padding(padding: EdgeInsets.all(8.0)),
        ],
      ),
    );
  }
}
