import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupRepository {
  // final ApiConsumer Api;

  // SignupRepository();

  Future signUp(
    String name,
    String phone,
    String email,
    String password,
  ) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'password must be at least 6 charachters ';
      } else if (e.code == 'email-already-in-use') {
        return 'this email is already in use';
      } else {
        return e.code.toString();
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future login(
    String email,
    String password,
  ) async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
      print(e.code);
      String message;
      if (e.code == 'wrong-password') {
        return 'The password is wrong or the user does not exist';
      } else if (e.code == 'invalid-email') {
        return 'this email is already in use';
      } else if (e.code == 'user-not-found') {
        return 'user not found';
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS' ||
          e.code == 'invalid-credential') {
        return 'username or password is incorrect';
      }
    } catch (e) {
      return e.toString();
    }
  }
}
