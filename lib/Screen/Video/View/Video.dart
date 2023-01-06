import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/VideoProvider.dart';

class Videopage extends StatefulWidget {
  const Videopage({Key? key}) : super(key: key);

  @override
  State<Videopage> createState() => _VideopageState();
}

class _VideopageState extends State<Videopage> {
  VideoProvider? providertrue;
  VideoProvider? providerfalse;

  @override
  void initState() {
    super.initState();
    Provider.of<VideoProvider>(context, listen: false).lodingplay();
  }

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<VideoProvider>(context, listen: true);
    providerfalse = Provider.of<VideoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Chewie(controller: providertrue!.lodingplay()),
      ),
    );
  }

  @override
  void dispose() {
    providerfalse!.chewieController!.pause();
    super.dispose();
  }
}
