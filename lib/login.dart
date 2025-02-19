import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            backgroundColor: Color.fromRGBO(175, 120, 99, 1),
            body: Center(
                child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 20),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'example@example.com',
                            ),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'password',
                              hintText: 'Pass@123',
                            ),
                          ),
                          SizedBox(height: 20),
                          TextButton(
                              onPressed: () {},
                              child: Text('login',
                                  style: GoogleFonts.sigmar(
                                    color: Color.fromARGB(255, 218, 187, 167),
                                    fontSize: 20,
                                  ))),
                        ])))));
  }
}
