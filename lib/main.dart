import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:player_video/Navigation%20bar/navigation%20bar.dart';
import 'package:player_video/Screen/Music/Provider/MusicProvider.dart';
import 'package:player_video/Screen/Music/View/musicShowpage/musicshowpage.dart';

import 'package:provider/provider.dart';

import 'Screen/Video/Provider/VideoProvider.dart';
import 'Screen/Video/View/Video.dart';
import 'Screen/Video/View/VideoPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => VideoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MusicProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => navigaterpage(),
          'V': (context) => Videopage(),
          'm':(context)=>MusicShowpage(),
        },
      ),
    ),
  );
}
