import 'package:flutter/material.dart';
import 'package:picfresh/screens/article_page.dart';
import 'package:picfresh/screens/camera_page.dart';
import 'package:picfresh/screens/home_page.dart';
import 'package:picfresh/screens/user_page.dart';
import 'package:picfresh/theme.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ArticlePage(),
    CameraPage(),
    HomePage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          backgroundColor: kWhiteColor,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                navBar1,
                height: bottomNavbarItemSize,
              ),
              icon: Image.asset(
                navBar11,
                height: bottomNavbarItemSize,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                navBar2,
                height: bottomNavbarItemSize,
              ),
              icon: Image.asset(
                navBar22,
                height: bottomNavbarItemSize,
              ),
              label: 'Article',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                navBar3,
                height: bottomNavbarItemSize,
              ),
              icon: Image.asset(
                navBar33,
                height: bottomNavbarItemSize,
              ),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                navBar4,
                height: bottomNavbarItemSize,
              ),
              icon: Image.asset(
                navBar44,
                height: bottomNavbarItemSize,
              ),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(
                navBar5,
                height: bottomNavbarItemSize,
              ),
              icon: Image.asset(
                navBar55,
                height: bottomNavbarItemSize,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
