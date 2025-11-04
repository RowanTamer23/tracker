import 'package:flutter/material.dart';
import 'package:tracker/core/routes/routes.dart';
import 'package:tracker/features/onboarding/view/widgets/text_button.dart';
import 'package:tracker/main.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool get isLightMode => Theme.of(context).brightness == Brightness.light;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              isLightMode
                  ? 'assets/images/todo2.gif'
                  : 'assets/images/onboarding1.gif',
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
                color: isLightMode
                    ? Color(0xFF4A403A)
                    : KColorSchemeDark.onPrimaryContainer,
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
