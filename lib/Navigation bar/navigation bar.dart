import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:player_video/Screen/Music/View/MusicPage.dart';

import '../Screen/Video/View/VideoPage.dart';

class navigaterpage extends StatefulWidget {
  const navigaterpage({Key? key}) : super(key: key);

  @override
  State<navigaterpage> createState() => _navigaterpageState();
}

class _navigaterpageState extends State<navigaterpage> {
  List Page = [VideoShowPage(), MusicPage()];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Page[i],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index){
            setState(() {
              i=index;
            });
          },
          currentIndex: i,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library_outlined), label: "Video"),
            BottomNavigationBarItem(
                icon: Icon(Icons.audiotrack), label: "Audio"),
          ],
        ),
      ),
    );
  }
}
