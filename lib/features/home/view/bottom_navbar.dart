import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/constant.dart';

import 'package:mobile_assignment_1/features/home/view/home_view.dart';
import 'package:mobile_assignment_1/features/map/map_view.dart';
import 'package:mobile_assignment_1/features/search/view/search_view.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const MapView(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Constant.kMainColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: "Search"),
          const BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.map), label: "Map"),
        ],
      ),
    );
  }
}
