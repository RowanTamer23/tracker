import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/core/routes/routes.dart';
import 'package:tracker/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:tracker/features/onboarding/cubit/onboarding_state.dart';
import 'package:tracker/features/onboarding/view/widgets/text_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  @override
  _LogInStateScreen createState() => _LogInStateScreen();
}

class _LogInStateScreen extends State<LogInScreen> {
  bool _isObscured = true;
  bool isRememberMe = true;
  final _formKey = GlobalKey<FormState>();

  void submit() {
    bool isvalid = _formKey.currentState!.validate();
    if (isvalid) {
      _formKey.currentState!.save();
      context.read<OnboardingCubit>().login();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.pushNamed(context, Routes.home);
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) => Scaffold(
            appBar: AppBar(),
            body: Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/icon/icon.png',
                            width: 250,
                            // height: 250,
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 70,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Login',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF5A442F))),
                                Text('please sign in to continue',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF5A442F))),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  onSaved: (Value) {
                                    context
                                        .read<OnboardingCubit>()
                                        .loginEmail
                                        .text = Value!;
                                  },
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty ||
                                        !value.contains('@') ||
                                        !value.contains('.com')) {
                                      return 'Please Enter a valid Email address';
                                    }
                                    return null;
                                  },
                                  cursorColor:
                                      Color.fromARGB(255, 218, 187, 167),
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          // Underline when clicked (focused)
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 218, 187, 167),
                                              width: 2)),
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 150)),
                                      hintText: 'example@example.com',
                                      hintStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 150))),
                                ),
                                TextFormField(
                                  onSaved: (Value) {
                                    context
                                        .read<OnboardingCubit>()
                                        .loginPassword
                                        .text = Value!;
                                  },
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'incorrect password';
                                    }
                                    return null;
                                  },
                                  obscureText: _isObscured,
                                  cursorColor:
                                      Color.fromARGB(255, 218, 187, 167),
                                  decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          // Underline when clicked (focused)
                                          borderSide: BorderSide(
                                              color: Color.fromARGB(
                                                  255, 218, 187, 167),
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
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    isRememberMe = !isRememberMe;
                                  });
                                },
                                icon: Icon(
                                    isRememberMe
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank,
                                    color: Color(0xFF5A442F)),
                                label: Text('Remember me'),
                                style: TextButton.styleFrom(
                                  foregroundColor: Color(0xFF5A442F),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: Color(0xFF5A442F)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: TextButtonWid(
                              text: 'Login',
                              onPressed: () {
                                submit();
                              },
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account ?'),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.signup);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(color: Color(0xFF5A442F)),
                                ),
                              )
                            ],
                          ),
                        ])))));
  }
}
