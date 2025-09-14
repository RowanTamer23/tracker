import 'package:flutter/material.dart';

class BulletScreen extends StatelessWidget {
  const BulletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bullet Screen'),
      ),
      body: Center(
        child: Text('This is the Bullet Screen'),
      ),
    );
  }
}
