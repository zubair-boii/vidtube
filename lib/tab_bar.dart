import 'package:flutter/material.dart';

import 'features/downloads/view/download_screen.dart';
import 'features/home/view/home_screen.dart';
import 'features/library/view/library_screen.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _currentTabIndex = 0;

  // screens for tab bar
  final _screens = [HomeScreen(), DownloadScreen(), LibraryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentTabIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,

        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_rounded),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_rounded),
            label: 'Downloads',
          ),
        ],
      ),
    );
  }
}
