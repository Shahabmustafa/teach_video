import 'package:flutter/material.dart';

class AlbumRotator extends StatefulWidget {
  AlbumRotator({Key? key,required this.profilePicUrl}) : super(key: key);
  String profilePicUrl;
  @override
  State<AlbumRotator> createState() => _AlbumRotatorState();
}

class _AlbumRotatorState extends State<AlbumRotator> with SingleTickerProviderStateMixin{
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    controller.forward();
    controller.repeat();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(
        begin: 0.0,
        end: 1.0,
      ).animate(controller),
      child: SizedBox(
        height: 40,
        width: 40,
        child: Column(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey,
                      Colors.white,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(35)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image(
                  image: NetworkImage(widget.profilePicUrl),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

