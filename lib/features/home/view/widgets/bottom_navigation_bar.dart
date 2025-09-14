import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tracker/features/bullet/view/screens/bullet_screen.dart';
import 'package:tracker/features/home/view/screens/home.dart';
import 'package:tracker/features/profile/view/screens/profile_screen.dart';

class BottomNavigationwid extends StatefulWidget {
  const BottomNavigationwid({super.key});
  @override
  _BottomNavigationwidState createState() => _BottomNavigationwidState();
}

class _BottomNavigationwidState extends State<BottomNavigationwid> {
  int selectedIndex = 0;

  final screens = const [
    HomeScreen(),
    BulletScreen(),
    ProfileScreen(),
  ]; // Current selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          height: 75,
          items: [
            Icon(Icons.home, size: 35),
            Icon(Icons.blur_on_outlined, size: 35),
            Icon(Icons.person, size: 35)
          ],
          index: selectedIndex,
          color: const Color.fromARGB(255, 182, 126, 78),
          backgroundColor: Colors.transparent,
          onTap: (index) => setState(() => selectedIndex = index),
        ));
  }
}
