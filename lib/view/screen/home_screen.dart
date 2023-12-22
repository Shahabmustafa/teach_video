import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/view/screen/add_video.dart';
import 'package:tiktok_clone/view/widget/custom_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  List PageIndex = [
    Text("Home"),
    Text("Home"),
    AddVideo(),
    Text("Home"),
    Text("Home"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pageIndex,
        onTap: (index){
          setState(() {
            pageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
          BottomNavigationBarItem(
              backgroundColor: backgroundColor,
              icon: Icon(Icons.search),
              label: "Search",
            ),
          BottomNavigationBarItem(
              backgroundColor: backgroundColor,
              icon: CustomIcon(),
              label: "",
            ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Message",
            ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
        ],
      ),
      body: Center(
        child: PageIndex[pageIndex],
      ),
    );
  }
}
