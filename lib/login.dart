import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatefulWidget {
  @override
  LogIn({super.key});
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
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
                            cursorColor: Color.fromARGB(255, 218, 187, 167),
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    // Underline when clicked (focused)
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 218, 187, 167),
                                        width: 2)),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 150)),
                                hintText: 'example@example.com',
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 150))),
                          ),
                          TextField(
                            obscureText: _isObscured,
                            cursorColor: Color.fromARGB(255, 218, 187, 167),
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    // Underline when clicked (focused)
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 218, 187, 167),
                                        width: 2)),
                                labelText: 'password',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscured
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscured = !_isObscured;
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 150)),
                                hintText: 'Pass@123',
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 150))),
                          ),
                          SizedBox(height: 30),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 218, 187, 167),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            child: Text('login',
                                style: GoogleFonts.sigmar(
                                  color: Color.fromRGBO(175, 120, 99, 1),
                                  fontSize: 23,
                                )),
                          )
                        ])))));
  }
}
