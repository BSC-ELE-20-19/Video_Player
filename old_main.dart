import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Player',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 100, 187, 115),
        ),
      ),
      home: const MyHomePage(title: 'Video Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                Container(height: 110),
                //RECENT PLAYED VIDEOS
                //RECENT PLAYED VIDEOS
                //RECENT PLAYED VIDEOS
                Text(
                  "Recent Media",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                    color: Color(0xFF9BCC39),
                    fontSize: 32,
                  ),
                ),
                Padding(padding: EdgeInsets.all(16.0)),
                recentMedia(),
                //RECENT PLAYED VIDEOS END
                //RECENT PLAYED VIDEOS END
                //RECENT PLAYED VIDEOS END
                Padding(padding: EdgeInsets.all(38.0)),
                headTitle(),
                Padding(padding: EdgeInsets.all(16.0)),
                Row(
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: () {},
                      fillColor: Color(0xFF9BCC39),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'VIDEOS',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    RawMaterialButton(
                      onPressed: () {},
                      fillColor: Color(0xFFF7F7F7),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'FOLDERS',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(16.0)),
                gridVideos(),
                Padding(padding: EdgeInsets.all(16.0)),
                gridVideos(),
                Padding(padding: EdgeInsets.all(16.0)),
                gridVideos(),
                Padding(padding: EdgeInsets.all(16.0)),
                gridVideos(),
                Padding(padding: EdgeInsets.all(16.0)),
                gridVideos(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column gridVideos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "03 February 2025",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            color: const Color.fromARGB(255, 0, 0, 0),
            fontSize: 14,
          ),
        ),
        Padding(padding: EdgeInsets.all(8.0)),
        recentMedia(),
      ],
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
          Container(color: Colors.blue, height: 160, width: 200),
          Padding(padding: EdgeInsets.all(8.0)),
          Container(color: Colors.blue, height: 160, width: 200),
          Padding(padding: EdgeInsets.all(8.0)),
          Container(color: Colors.blue, height: 160, width: 200),
        ],
      ),
    );
  }
}
