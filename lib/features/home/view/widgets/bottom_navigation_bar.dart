import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationwid extends StatefulWidget {
  const BottomNavigationwid({super.key});
  @override
  _BottomNavigationwidState createState() => _BottomNavigationwidState();
}

class _BottomNavigationwidState extends State<BottomNavigationwid> {
  int selectedIndex = 0; // Current selected index

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: [
        Icon(Icons.home, size: 35),
        Icon(Icons.blur_on_outlined, size: 35),
        Icon(Icons.person, size: 35)
      ],
      color: Color.fromARGB(133, 58, 48, 39),
      backgroundColor: Color(
        0xFFBF9D81,
      ),
      onTap: _onItemTapped,
    );
  }
}
