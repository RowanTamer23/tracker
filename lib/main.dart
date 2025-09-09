import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tracker/core/routes/app_routers.dart';
import 'package:tracker/core/routes/routes.dart';
import 'package:tracker/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:tracker/features/onboarding/repository/onboarding_repository.dart';
import 'package:tracker/firebase_options.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Tracker',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'Sigmar',
              appBarTheme: AppBarTheme(
                  backgroundColor: Color(
                0xFFBF9D81,
              )),
              scaffoldBackgroundColor: Color(
                0xFFBF9D81,
              ),
              dialogTheme: DialogThemeData(
                  backgroundColor: Color(
                0xFFBF9D81,
              ))),
          initialRoute: Routes.onboarding,
          onGenerateRoute: AppRouter().generateRoute,
        );
      },
    );
  }
}
