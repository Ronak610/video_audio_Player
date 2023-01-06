import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../Model/VideoModal.dart';

class VideoProvider extends ChangeNotifier {
  bool isplay = false;
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;

  VideoModel? V1;

  ChewieController lodingplay() {
    videoPlayerController = VideoPlayerController.asset(
      "${V1!.Video}",
    )..initialize();

    return chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        autoPlay: false,
        materialProgressColors: ChewieProgressColors(
            backgroundColor: Colors.black12, playedColor: Colors.white));
  }

  void play(bool h) {
    isplay = h;
    notifyListeners();
  }

  List<VideoModel> videolist = [
    VideoModel(
        image: "aseets/image/nanpan.jpg",
        Video: "aseets/video/videoplayback.mp4"),
    VideoModel(
        image: "aseets/image/rayfale.jpg",
        Video: "aseets/video/rayfale.mp4"),
    VideoModel(
        image: "aseets/image/eklo.jpg",
        Video: "aseets/video/Eklo.mp4"),
    VideoModel(
        image: "aseets/image/jag.jpg",
        Video: "aseets/video/jag.mp4"),
    VideoModel(
        image: "aseets/image/chashma.jpg",
        Video: "aseets/video/Chashma.mp4"),
  ];
}
