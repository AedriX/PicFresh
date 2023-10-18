import 'package:flutter/material.dart';
import 'user_page.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const SizedBox(
            width: double.infinity,
            height: 45,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  contentPadding: EdgeInsets.all(10),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 211, 211, 211)),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 3, color: Color.fromARGB(255, 211, 211, 211)),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  hintText: "Looking for something?",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ),
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
          elevation: 5,
          unselectedItemColor: Colors.grey,
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
            Container(),
            Container(),
            Container(),
            Container(),
            Profile(),
          ],
        ));
  }
}
