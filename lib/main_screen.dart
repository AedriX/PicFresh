import 'package:flutter/material.dart';
import 'package:picfresh/screens/article_page.dart';
import 'package:picfresh/screens/home_page.dart';
import 'screens/user_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.article_outlined), label: 'Articles'),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt_outlined), label: 'Scan'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border_outlined), label: 'Bookmark'),
            BottomNavigationBarItem(
                icon: Icon(Icons.badge_outlined), label: 'Setting'),
          ],
          currentIndex: _selectedTabIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 100,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              _selectedTabIndex = index;
            });
          },
        ),
        body: IndexedStack(
          index: _selectedTabIndex,
          children: [
            HomePage(),
            const ArticlePage(),
            Container(),
            Container(),
            Profile(),
          ],
        ));
  }
}
