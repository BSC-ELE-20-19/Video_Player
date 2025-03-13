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
          padding: EdgeInsets.only(right: 10, top: 12),
          child: SizedBox(
            height: 200,
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  color: const Color(0xFFf7f7f7),
                  height: 160,
                  width: 200,
                ),
                Text("Mlimi Digital Acades", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 24)),
        Text(
          text,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: containerList),
        ),
        Padding(padding: EdgeInsets.only(bottom: 40)),
      ],
    );
  }
}
