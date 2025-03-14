import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  final String text;
  final double number;

  const Video({super.key, required this.text, required this.number});

  @override
  Widget build(BuildContext context) {
    List<Widget> containerList = [];

    for (int i = 0; i < number; i++) {
      containerList.add(
        Padding(
          padding: EdgeInsets.only(top: 18),
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: RawMaterialButton(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 150,
                    alignment:
                        Alignment.center, // Align the image at the center
                    child: Image.asset(
                      'images/download.jpg',
                      width: 150,
                      height: 100, // Your image asset path
                      fit: BoxFit.cover, // BoxFit options like cover or contain
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 16)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Mlimi Digital Acades farmer registration will loren",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          //olor: const Color(0xDBFFFFFF),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text("Duration: 44:36", style: TextStyle(fontSize: 16)),
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
          "120 Videos Found",
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
