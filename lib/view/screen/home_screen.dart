import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  List PageIndex = [
    "Home",
    "Search",
    "Message",
    "Profile",
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
        child: T,
      ),
    );
  }
}
