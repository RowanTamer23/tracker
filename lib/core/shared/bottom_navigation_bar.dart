import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tracker/features/bullet/view/screens/bullet_screen.dart';
import 'package:tracker/features/home/view/screens/home.dart';
import 'package:tracker/features/profile/view/screens/profile_screen.dart';
import 'package:tracker/main.dart';

class BottomNavigationwid extends StatefulWidget {
  const BottomNavigationwid({super.key});
  @override
  _BottomNavigationwidState createState() => _BottomNavigationwidState();
}

class _BottomNavigationwidState extends State<BottomNavigationwid> {
  bool get isLightMode => Theme.of(context).brightness == Brightness.light;

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
            Icon(Icons.home,
                size: 35,
                color: isLightMode
                    ? KColorScheme.onPrimaryContainer
                    : KColorSchemeDark.onPrimaryContainer),
            Icon(Icons.blur_on_outlined,
                size: 35,
                color: isLightMode
                    ? KColorScheme.onPrimaryContainer
                    : KColorSchemeDark.onPrimaryContainer),
            Icon(Icons.person,
                size: 35,
                color: isLightMode
                    ? KColorScheme.onPrimaryContainer
                    : KColorSchemeDark.onPrimaryContainer)
          ],
          index: selectedIndex,
          color: isLightMode
              ? KColorScheme.secondary
              : KColorSchemeDark.onInverseSurface,
          buttonBackgroundColor: isLightMode
              ? KColorScheme.secondary
              : KColorSchemeDark.onInverseSurface,
          backgroundColor: Colors.transparent,
          onTap: (index) => setState(() => selectedIndex = index),
        ));
  }
}
