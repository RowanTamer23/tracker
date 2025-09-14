import 'package:flutter/material.dart';
import 'package:tracker/features/bullet/view/screens/bullet_screen.dart';
import 'package:tracker/features/home/view/screens/home.dart';
import 'package:tracker/features/home/view/widgets/bottom_navigation_bar.dart';
import 'package:tracker/features/onboarding/view/screens/login_screen.dart';
import 'package:tracker/core/routes/routes.dart';
import 'package:tracker/features/onboarding/view/screens/onboarding_screen.dart';
import 'package:tracker/features/onboarding/view/screens/signup_Screen.dart';
import 'package:tracker/features/profile/view/screens/profile_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboarding:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.login:
        return MaterialPageRoute(builder: (_) => LogInScreen());

      case Routes.signup:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case Routes.profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case Routes.bullet:
        return MaterialPageRoute(builder: (_) => BulletScreen());

      case Routes.bottomNav:
        return MaterialPageRoute(builder: (_) => BottomNavigationwid());
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
