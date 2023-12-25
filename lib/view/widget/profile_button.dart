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
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(35),
                child: Image(
                  image: NetworkImage(profileImageUrl.toString()),
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
