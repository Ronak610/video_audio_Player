import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:player_video/Screen/Music/Provider/MusicProvider.dart';
import 'package:provider/provider.dart';

class MusicShowpage extends StatefulWidget {
  const MusicShowpage({Key? key}) : super(key: key);

  @override
  State<MusicShowpage> createState() => _MusicShowpageState();
}

class _MusicShowpageState extends State<MusicShowpage> {
  MusicProvider? providertrue;
  MusicProvider? providerfalse;

  @override
  void initState() {
    super.initState();
    Provider.of<MusicProvider>(context, listen: false).loading();
  }

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<MusicProvider>(context, listen: true);
    providerfalse = Provider.of<MusicProvider>(context, listen: false);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("${providertrue!.M1!.name}"),
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                "${providertrue!.M1!.image}",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black54,
            ),
            PlayerBuilder.currentPosition(
              player: providerfalse!.assetsAudioPlayer,
              builder: (context, position) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      height: 200,
                      width: 300,
                      child: Image.asset(
                        "${providertrue!.M1!.image}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    "${providertrue!.M1!.name}",
                    style:
                        GoogleFonts.satisfy(color: Colors.white, fontSize: 30),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            providerfalse!.Changeheadplay(!providertrue!.M1!.stop!,
                                providertrue!.M1!.ind!);
                            if (providertrue!
                                .Musiclist[providertrue!.M1!.ind!].stop!) {
                              providerfalse!.assetsAudioPlayer.stop();
                            } else {
                              providerfalse!.assetsAudioPlayer.play();
                            }
                          },
                          icon: Icon(providertrue!.M1!.stop!?
                            Icons.stop:Icons.play_arrow,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              providerfalse!.Changeplay(
                                  !providertrue!.M1!.play!,
                                  providertrue!.M1!.ind!);
                              if (providertrue!
                                  .Musiclist[providertrue!.M1!.ind!].play!) {
                                providerfalse!.assetsAudioPlayer.pause();
                              } else {
                                providerfalse!.assetsAudioPlayer.play();
                              }
                            },
                            icon: Icon(
                              providertrue!.M1!.play!
                                  ? Icons.play_arrow
                                  : Icons.pause,
                              size: 50,
                              color: Colors.white,
                            )),
                        IconButton(
                          onPressed: () {
                            providerfalse!.Changeheadplay(!providertrue!.M1!.head!,
                                providertrue!.M1!.ind!);
                            if (providertrue!
                                .Musiclist[providertrue!.M1!.ind!].head!) {
                              providerfalse!.assetsAudioPlayer.setVolume(0);
                            } else {
                              providerfalse!.assetsAudioPlayer.setVolume(100);
                            }
                          },
                          icon: Icon(
                            providertrue!.M1!.head!
                                ? Icons.headset_off
                                : Icons.headset,
                            color: Colors.white,
                          ),
                        ),
                      ]),
                  Slider(
                    value: position.inSeconds.toDouble(),
                    onChanged: (value) {
                      providerfalse!.assetsAudioPlayer.seek(
                        Duration(
                          seconds: value.toInt(),
                        ),
                      );
                    },
                    max: providertrue!.songDuration.inSeconds.toDouble(),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${position.inMinutes}:${position.inSeconds.remainder(60)}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "${providertrue!.songDuration.inMinutes}:${providerfalse!.songDuration.inSeconds.remainder(60)}",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    providerfalse!.assetsAudioPlayer.pause();
    super.deactivate();
  }
}
