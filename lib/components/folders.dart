import 'package:flutter/material.dart';
import 'package:video_player/pages/playlist.dart';

class Folder extends StatelessWidget {
  final String folderName;
  final double folderCount;

  const Folder({
    super.key,
    required this.folderName,
    required this.folderCount,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> containerList = [];

    for (int i = 0; i < folderCount; i++) {
      containerList.add(
        Padding(
          padding: EdgeInsets.only(top: 18),
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: RawMaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Playlist()),
                );
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7f7f7),
                      // Background color
                      border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.20), // Border color
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                        4.0,
                      ), // Rounded corners
                    ),
                    alignment:
                        Alignment.center, // Align the image at the center
                    child: Image.asset(
                      'icons/folder.png',
                      width: 60,
                      height: 60, // Your image asset path
                      fit: BoxFit.cover, // BoxFit options like cover or contain
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 16)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Mlimi Digital Acades",
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text("7 Videos", style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 34)),
        Text(
          "17 Folders Found",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: containerList),
        ),
      ],
    );
  }
}
