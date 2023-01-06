import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:player_video/Screen/Music/Provider/MusicProvider.dart';
import 'package:provider/provider.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  MusicProvider? providertrue;
  MusicProvider? providerfalse;

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<MusicProvider>(context, listen: true);
    providerfalse = Provider.of<MusicProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Music",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemBuilder: (context, index) => Container(
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      onTap: () {
                        providerfalse!.M1 = providertrue!.Musiclist[index];
                        Navigator.pushNamed(context, 'm');
                      },
                      leading: Container(
                          height: double.infinity,
                          child: CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage(
                                "${providertrue!.Musiclist[index].image}",
                              ))),
                      title: Text("${providertrue!.Musiclist[index].name}"),
                      trailing: IconButton(
                        onPressed: () {
                          providerfalse!.Changeplay(
                              !providertrue!.Musiclist[index].play!, index);
                          if (providertrue!.Musiclist[index].play!) {
                            providerfalse!.assetsAudioPlayer.pause();
                          } else {
                            providerfalse!.assetsAudioPlayer.play();
                          }
                        },
                        icon: Icon(
                          providertrue!.Musiclist[index].play!
                              ? Icons.pause
                              : Icons.play_arrow,

                          size: 25,
                        ),
                      ),
                    ),
                  ),
              itemCount: providerfalse!.Musiclist!.length),
        ),
      ),
    );
  }
}
