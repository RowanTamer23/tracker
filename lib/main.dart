import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
              debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
              child: const Image(
                  image:
                      AssetImage('assets/16b047df26cffb3537d489b0c0f93961.jpg'),
                  height: 400)),
        ));
  }
}
