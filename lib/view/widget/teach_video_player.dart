


import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class TeachVideoPlayer extends StatefulWidget {
  TeachVideoPlayer({Key? key,required this.videoUrl}) : super(key: key);
  String videoUrl;
  @override
  State<TeachVideoPlayer> createState() => _TeachVideoPlayerState();
}

class _TeachVideoPlayerState extends State<TeachVideoPlayer> {
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)..initialize().then((value){
      videoPlayerController.play();
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height,
      width: size.width,
      child: VideoPlayer(videoPlayerController),
    );
  }
}
