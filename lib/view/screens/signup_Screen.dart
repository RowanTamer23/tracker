import 'package:flutter/material.dart';
import 'package:tracker/core/routes/routes.dart';
import 'package:tracker/view/widgets/text_button.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFBF9D81),
        appBar: AppBar(
          backgroundColor: Color(0xFFBF9D81),
        ),
        body: Center(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextField(
                        cursorColor: Color.fromARGB(255, 218, 187, 167),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                // Underline when clicked (focused)
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 218, 187, 167),
                                    width: 2)),
                            labelText: 'Name',
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, 150)),
                            hintText: 'John Doe',
                            hintStyle:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, 150))),
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
                      TextField(
                        obscureText: _isObscured,
                        cursorColor: Color.fromARGB(255, 218, 187, 167),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                // Underline when clicked (focused)
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 218, 187, 167),
                                    width: 2)),
                            labelText: 'Confirm password',
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
                      SizedBox(
                        width: double.infinity,
                        child: TextButtonWid(
                          text: 'Sign Up',
                          onPressed: () {
                            // Handle login action
                          },
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account ?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'LogIn',
                              style: TextStyle(color: Color(0xFF5A442F)),
                            ),
                          )
                        ],
                      ),
                    ]))));
  }
}
