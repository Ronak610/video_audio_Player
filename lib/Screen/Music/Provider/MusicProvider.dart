import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:player_video/Screen/Music/Model/MusicModal.dart';

class MusicProvider extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration songDuration = Duration(seconds: 0);
  MusicModal? M1;

  void Changeplay(bool value, inde) {
    Musiclist[inde].play = value;
    notifyListeners();
  }

  void Changeheadplay(bool value, inde) {
    Musiclist[inde].head = value;
    notifyListeners();
  }

  void Changestop(bool value, inde) {
    Musiclist[inde].stop = value;
    notifyListeners();
  }

  void loading() {
    assetsAudioPlayer.open(
      autoStart: false,
      showNotification: true,
      Audio("${M1!.music}"),
    );
    tDuration();
  }

  void tDuration() {
    assetsAudioPlayer.current.listen((event) {
      songDuration = event!.audio.duration;
    });
  }

  List<MusicModal> Musiclist = [
    MusicModal(
        ind: 0,
        play: false,
        stop: true,
        head: false,
        image: "aseets/image/nanpan.jpg",
        name: "Nan Pan Nedlo",
        music: "aseets/Music/nanpan.mp3"),
    MusicModal(
        ind: 1,
        play: false,
        stop: true,
        head: false,
        image: "aseets/image/rayfale.jpg",
        name: "Rayfale ",
        music: "aseets/Music/rayfale.mp3"),
    MusicModal(
        ind: 2,
        play: false,
        stop: true,
        head: false,
        image: "aseets/image/eklo.jpg",
        name: "Eklo pan Ekdo",
        music: "aseets/Music/Eklo.mp3"),
    MusicModal(
        ind: 3,
        play: false,
        stop: true,
        head: false,
        image: "aseets/image/jag.jpg",
        name: "Jag jiti Lav",
        music: "aseets/Music/jagjiti.mp3"),
    MusicModal(
        ind: 4,
        play: false,
        stop: true,
        head: false,
        image: "aseets/image/chashma.jpg",
        name: "Chashma Utaro",
        music: "aseets/Music/chashma.mp3"),
  ];
}
