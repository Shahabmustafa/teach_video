import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  ProfileButton({Key? key,this.profileImageUrl}) : super(key: key);
  String? profileImageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        children: [
          Positioned(
            right: 10,
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ClipRRect(
                child: Image(
                  image: NetworkImage("https://cdn-icons-png.flaticon.com/128/3135/3135715.png"),
                  // image: NetworkImage(profileImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
