import 'package:flutter/material.dart';
import 'package:tracker/view/widgets/text_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  @override
  _LogInStateScreen createState() => _LogInStateScreen();
}

class _LogInStateScreen extends State<LogInScreen> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFBF9D81),
        ),
        backgroundColor: Color(0xFFBF9D81),
        body: Center(
            child: Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      TextField(
                        cursorColor: Color.fromARGB(255, 218, 187, 167),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                // Underline when clicked (focused)
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 218, 187, 167),
                                    width: 2)),
                            labelText: 'Email',
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, 150)),
                            hintText: 'example@example.com',
                            hintStyle:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, 150))),
                      ),
                      TextField(
                        obscureText: _isObscured,
                        cursorColor: Color.fromARGB(255, 218, 187, 167),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                // Underline when clicked (focused)
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 218, 187, 167),
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
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, 150)),
                            hintText: 'Pass@123',
                            hintStyle:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, 150))),
                      ),
                      SizedBox(height: 30),
                      TextButtonWid(
                        text: 'Login',
                        onPressed: () {
                          // Handle login action
                        },
                      )
                    ]))));
  }
}
