import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/VideoProvider.dart';

class VideoShowPage extends StatefulWidget {
  const VideoShowPage({Key? key}) : super(key: key);

  @override
  State<VideoShowPage> createState() => _VideoShowPageState();
}

class _VideoShowPageState extends State<VideoShowPage> {
  VideoProvider? providertrue;
  VideoProvider? providerfalse;

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<VideoProvider>(context, listen: true);
    providerfalse = Provider.of<VideoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Video Player",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: providertrue!.videolist.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  providerfalse!.V1 = providertrue!.videolist[index];
                  Navigator.pushNamed(context, 'V');
                },
                child: Container(
                  height: 200,
                  width: 190,
                  decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      fit: BoxFit.fill,
                      height: double.infinity,
                      width: double.infinity,
                      image: AssetImage(
                        "${providertrue!.videolist[index].image}",
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
