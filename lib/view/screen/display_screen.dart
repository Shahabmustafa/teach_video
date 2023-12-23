

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/view/widget/teach_video_player.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: PageController(initialPage: 0,viewportFraction: 1),
        itemCount: 10,
        itemBuilder: (context,index){
          return Stack(
            children: [
              TeachVideoPlayer(videoUrl: "videoUrl"),
              Container(
                margin: EdgeInsets.only(left: 15,bottom: 15),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Shahab Mustafa",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "My Caption Name",
                    ),
                    Text(
                      "Song Name",
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
