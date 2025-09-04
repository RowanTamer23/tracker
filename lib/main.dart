import 'package:flutter/material.dart';
import 'package:tracker/core/routes/app_routers.dart';
import 'package:tracker/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: const Size(375, 812),
      minTextAdapt: true,

      child: MaterialApp(
        title: 'Tracker',

        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Sigmar',
          dialogTheme: DialogThemeData(backgroundColor: Colors.white),
        ),
        initialRoute:
            Routes.onboarding, // Set the initial route to the onboarding screen

        onGenerateRoute: AppRouter().generateRoute,
      ),
    );
  }
}
