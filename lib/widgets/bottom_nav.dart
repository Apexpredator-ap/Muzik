import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../view/home_screen.dart';
import '../view/library.dart';
import '../view/search.dart';
import '../view/settings.dart';

class CustomBottomNavigationBar extends StatefulWidget {


  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentTabPage = 0;
  late List<Widget> pages;
  late HomePage home;
  late SearchPage search;
  late LibraryPage library;
  late ProfilePage profile;

  List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.library_music_sharp,
    Icons.account_circle,
  ];

  @override
  void initState() {
    home = HomePage();   // Pass userId to HomePage
    search = SearchPage();    // Modify these pages as needed if they require userId
    library = LibraryPage();
    profile = ProfilePage();
    pages = [home, search, library, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Colors.blue,
        height: 65,
        onTap: (int index) {
          setState(() {
            currentTabPage = index;
          });
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.red,
          ),
          Icon(
            Icons.search,
            color: Colors.blue,
          ),
          Icon(
            Icons.library_music_sharp,
            color: Colors.blue,
          ),
          Icon(
            Icons.person_outline,
            color: Colors.blue,
          ),
        ],
      ),
      body: pages[currentTabPage],
    );
  }
}
