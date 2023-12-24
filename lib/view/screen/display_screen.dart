

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/view/widget/album_rotator.dart';
import 'package:tiktok_clone/view/widget/profile_button.dart';
import 'package:tiktok_clone/view/widget/teach_video_player.dart';

class DisplayScreen extends StatefulWidget {
  const DisplayScreen({Key? key}) : super(key: key);

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
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
              Positioned(
                right: -10,
                child: Container(
                  width: 100,
                  height: 500,
                  margin: EdgeInsets.only(top: padding.top * 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ProfileButton(),
                      const Column(
                        children: [
                          Icon(Icons.favorite,size: 35,color: Colors.white,),
                          Text(
                            "234",
                          ),
                        ],
                      ),
                      IconsButtonWidgets(
                        title: "35",
                        imagesUrl: "chat.png",
                      ),
                      const Column(
                        children: [
                          Icon(Icons.bookmark,size: 35,color: Colors.white,),
                          Text(
                            "5",
                          ),
                        ],
                      ),
                      IconsButtonWidgets(
                        title: "1",
                        imagesUrl: "share.png",
                      ),
                      AlbumRotator(
                        profilePicUrl: "https://cdn-icons-png.flaticon.com/128/26/26805.png",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


class IconsButtonWidgets extends StatelessWidget {
  IconsButtonWidgets({Key? key,required this.imagesUrl,required this.title}) : super(key: key);
  String imagesUrl;
  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/$imagesUrl",height: 30,width: 30,color: Colors.white,),
        Text(
          title,
        ),
      ],
    );
  }
}

