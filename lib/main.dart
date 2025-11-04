import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracker/core/routes/app_routers.dart';
import 'package:tracker/core/routes/routes.dart';
import 'package:tracker/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:tracker/features/onboarding/repository/onboarding_repository.dart';
import 'package:tracker/firebase_options.dart';

var KColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 191, 157, 129));

var KColorSchemeDark = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 19, 26, 54),
  brightness: Brightness.dark,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OnboardingCubit(SignupRepository()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadThemeMode(); // Load saved theme when app starts
  }

  void updateThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('themeMode') ?? 'system';
    setState(() {
      _themeMode = _fromString(savedTheme);
      _isLoaded = true;
    });
  }

  ThemeMode _fromString(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', _toString(mode));
    setState(() {
      _themeMode = mode;
    });
  }

  String _toString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      default:
        return 'system';
    }
  }

  bool get isLightMode => _themeMode == ThemeMode.light;

  void toggleTheme(bool value) {
    setState(() {
      _themeMode = value ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          themeMode: _themeMode,

          // --------------- Light Theme -----------------
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: KColorScheme.primaryFixed,
            colorScheme: KColorScheme,
            appBarTheme: AppBarTheme().copyWith(
              backgroundColor: KColorScheme.secondary,
              actionsIconTheme: IconThemeData().copyWith(
                color: KColorScheme.onPrimaryContainer,
              ),
              titleTextStyle: TextStyle(
                fontSize: 18,
                fontFamily: 'Sigmar',
                color: KColorScheme.onPrimaryContainer,
              ),
            ),
          ),

          // --------------- Dark Theme -----------------

          darkTheme: ThemeData.dark().copyWith(
            colorScheme: KColorSchemeDark,
            appBarTheme: AppBarTheme().copyWith(
              titleTextStyle: TextStyle(
                fontSize: 18,
                color: KColorSchemeDark.onPrimaryContainer,
                // fontWeight: FontWeight.bold,
              ),
              actionsIconTheme: IconThemeData().copyWith(
                color: KColorSchemeDark.onPrimaryContainer,
              ),
              backgroundColor: KColorSchemeDark.onInverseSurface,
            ),
            iconTheme:
                IconThemeData().copyWith(color: KColorSchemeDark.onPrimary),
            iconButtonTheme: IconButtonThemeData(
              style: ElevatedButton.styleFrom(
                iconColor: KColorSchemeDark.onPrimaryContainer,
              ),
            ),
            cardTheme: CardThemeData(
              color: KColorSchemeDark.primary,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: KColorSchemeDark.secondaryContainer,
              ),
            ),
            textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                    color: KColorSchemeDark.onSecondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  bodyMedium: TextStyle(
                    color: KColorSchemeDark.onSecondaryContainer,
                    fontSize: 16,
                  ),
                  titleMedium:
                      TextStyle(color: KColorSchemeDark.onPrimaryContainer),
                ),
          ),

          title: 'Tracker',
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.onboarding,
          onGenerateRoute: AppRouter().generateRoute,
        );
      },
    );
  }
}
