import 'package:flutter/material.dart';
import 'package:tracker/view/screens/login_screen.dart';
import 'package:tracker/core/routes/routes.dart';
import 'package:tracker/view/screens/onboarding_screen.dart';
import 'package:tracker/view/screens/signup_Screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => LogInScreen());

      case Routes.signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
    }

    // Unknown route
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
