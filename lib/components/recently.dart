import 'package:flutter/material.dart';

class RecentlyPlayed extends StatelessWidget {
  //final String title;
  final double number;
  //final double lastPoint;
  const RecentlyPlayed({
    super.key,
    required this.number,
    //required this.lastPoint,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> containerList = [];

    for (int i = 0; i < number; i++) {
      containerList.add(
        Padding(
          padding: EdgeInsets.only(right: 10, top: 16),
          child: SizedBox(
            height: 208,
            width: 200,
            child: RawMaterialButton(
              onPressed: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 160,
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFFf7f7f7),
                      border: Border.all(
                        //color: Color.fromRGBO(0, 0, 0, 0.20), // Border color
                        color: Color(0xFF444444),
                        width: 2.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ), // Rounded corners
                    ),
                    child: Image.asset(
                      'images/download.jpg',
                      width: 160,
                      height: 200, // Your image asset path
                      fit: BoxFit.cover, // BoxFit options like cover or contain
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Text("Mlimi Digital Acades", style: TextStyle(fontSize: 18)),
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: containerList),
        ),
      ],
    );
  }
}
