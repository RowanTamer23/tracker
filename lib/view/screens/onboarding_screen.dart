import 'package:flutter/material.dart';
import 'package:tracker/core/routes/routes.dart';
import 'package:tracker/view/widgets/text_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBF9D81),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/todo1.gif',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
            Text(
              'Your safe space to track your life journey and create new healthy habits.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4A403A),
              ),
            ),
            SizedBox(height: 20),
            TextButtonWid(
              text: 'Get Started',
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
