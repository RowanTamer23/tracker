import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/core/routes/routes.dart';
import 'package:tracker/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:tracker/features/onboarding/cubit/onboarding_state.dart';
import 'package:tracker/features/onboarding/view/widgets/text_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  String password = '';
  String confirmPassword = '';
  bool _isObscured = true;

  void submit() {
    bool isvalid = _formKey.currentState!.validate();
    if (isvalid) {
      _formKey.currentState!.save();
      context.read<OnboardingCubit>().signUp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            Navigator.pushNamed(context, Routes.login);
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMessage)));
          } else {
            SnackBar(content: Text('problem happened'));
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
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 70,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('SignUp',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF5A442F))),
                                Text('please create an account to continue',
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
                                        .signUpName
                                        .text = Value!;
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
                                      labelText: 'Name',
                                      labelStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 150)),
                                      hintText: 'John Doe',
                                      hintStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 150))),
                                ),
                                TextFormField(
                                  onSaved: (Value) {
                                    context
                                        .read<OnboardingCubit>()
                                        .signUpEmail
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
                                    password = Value!;
                                    context
                                        .read<OnboardingCubit>()
                                        .signUpPassword
                                        .text = Value!;
                                  },
                                  validator: (value) {
                                    if (value == null ||
                                        value.trim().isEmpty ||
                                        value.trim().length < 6) {
                                      return 'Please Enter a valid password';
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
                                TextFormField(
                                  onSaved: (Value) {
                                    confirmPassword = Value!;
                                    context
                                        .read<OnboardingCubit>()
                                        .confirmPassword
                                        .text = Value!;
                                  },
                                  validator: (value) {
                                    if (value == null ||
                                        password != confirmPassword) {
                                      return 'Password doesn\'t match';
                                    }
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
                                      labelStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 150)),
                                      hintText: 'Pass@123',
                                      hintStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 150))),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: TextButtonWid(
                              text: state is SignUpLoading
                                  ? 'loading ... '
                                  : 'Sign Up',
                              onPressed: () {
                                submit();
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
                        ])))));
  }
}
