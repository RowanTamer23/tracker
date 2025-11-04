import 'package:flutter/material.dart';

class BulletCard extends StatelessWidget {
  final String title;

  final VoidCallback? onTap;
  final bool compact;
  final Icon icon;
  final Color iconColor;
  final Color backgroundColor;

  const BulletCard({
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    this.onTap,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
            // color: Color(0xffFFF3E0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: const Color.fromARGB(255, 86, 41, 41)),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [backgroundColor, backgroundColor.withOpacity(0.8)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 80,
                      width: 100,
                      alignment: Alignment.center,
                      child: Icon(
                        icon.icon,
                        size: 50,
                        color: iconColor,
                      )),
                  Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: iconColor)),
                ],
              ),
            )));
  }
}
